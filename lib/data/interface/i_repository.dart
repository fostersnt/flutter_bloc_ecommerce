abstract class IRepository<FosterTheProgrammer> {
  Future<List<FosterTheProgrammer>> getAllData();
  Future<List<FosterTheProgrammer>> getSingleData();
  Future<List<FosterTheProgrammer>> deleteData();
  Future<List<FosterTheProgrammer>> updateData();
}
