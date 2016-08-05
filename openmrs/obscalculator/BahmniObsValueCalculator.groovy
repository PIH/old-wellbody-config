import org.apache.commons.lang.StringUtils
import org.openmrs.api.context.Context
import org.openmrs.module.bahmniemrapi.encountertransaction.contract.BahmniEncounterTransaction
import org.openmrs.module.bahmniemrapi.encountertransaction.contract.BahmniObservation
import org.openmrs.module.bahmniemrapi.obscalculator.ObsValueCalculator
import org.openmrs.module.emrapi.encounter.domain.EncounterTransaction

public class BahmniObsValueCalculator implements ObsValueCalculator {

    private final static String HEIGHT_UUID = "3ce93cf2-26fe-102b-80cb-0017a47871b2"

    private final static String WEIGHT_UUID = "3ce93b62-26fe-102b-80cb-0017a47871b2"

    private final static String BMI_UUID = "1342AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"

    private final static String VITALS_UUID = "80c8b161-a871-42db-a1ca-185095a1d798";


    public void run(BahmniEncounterTransaction bahmniEncounterTransaction) {
        calculateAndAdd(bahmniEncounterTransaction);
    }

    static def calculateAndAdd(BahmniEncounterTransaction bahmniEncounterTransaction) {
        Collection<BahmniObservation> observations = bahmniEncounterTransaction.getObservations()

        BahmniObservation heightObservation = null // find(HEIGHT_UUID, observations)
        BahmniObservation weightObservation = null // find(WEIGHT_UUID, observations)
        BahmniObservation vitalsObservation = null // find(VITALS_UUID, observations)

        find(BMI_UUID, observations)

        if (vitalsObservation != null && hasValue(heightObservation) && hasValue(weightObservation)) {

            Double height = heightObservation.getValue() as Double
            Double weight = weightObservation.getValue() as Double

            BahmniObservation oldBmiObs = find(BMI_UUID, observations)

            if (oldBmiObs != null) {
                oldBmiObs.voided = true
            }

            Date obsDatetime = getDate(weightObservation) != null ? getDate(weightObservation) : getDate(heightObservation)
            BahmniObservation bmiObs =  createObs(BMI_UUID, vitalsObservation, bahmniEncounterTransaction, obsDatetime) as BahmniObservation
            def bmi = bmi(height, weight)
            bmiObs.setValue(bmi);

            return
        }

    }

    static def bmi(Double height, Double weight) {
        Double heightInMeters = height / 100;
        Double value = weight / (heightInMeters * heightInMeters);
        return new BigDecimal(value).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
    };

    private static boolean hasValue(BahmniObservation observation) {
        return observation != null && observation.getValue() != null && !StringUtils.isEmpty(observation.getValue().toString());
    }

    private static Date getDate(BahmniObservation observation) {
        return hasValue(observation) && !observation.voided ? observation.getObservationDateTime() : null;
    }

    static BahmniObservation find(String uuid, Collection<BahmniObservation> observations) {

        for (BahmniObservation observation : observations) {

            System.out.println(observation.getConcept().getUuid())

            if (uuid.equalsIgnoreCase(observation.getConcept().getUuid())) {
                return observation;
            }
            BahmniObservation matchingObservation = find(uuid, observation.getGroupMembers())
            if (matchingObservation != null) {
                return matchingObservation;
            }
        }
        return null
    }

    static BahmniObservation createObs(String uuid, BahmniObservation parent, BahmniEncounterTransaction encounterTransaction, Date obsDatetime) {
        def concept = Context.getConceptService().getConceptByUuid(uuid)
        BahmniObservation newObservation = new BahmniObservation()
        newObservation.setConcept(new EncounterTransaction.Concept(concept.getUuid()))
        newObservation.setObservationDateTime(obsDatetime)
        parent == null ? encounterTransaction.addObservation(newObservation) : parent.addGroupMember(newObservation)
        return newObservation
    }


}
