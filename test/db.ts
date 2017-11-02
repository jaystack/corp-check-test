import { MongoClient } from 'mongodb';

const MONGO_URL = process.env.MONGO_URL || 'mongodb://localhost:27017/corp-check';

const popularPackageNames = [ 'popular-a', 'popular-b', 'popular-c' ];

export const mockPopularPackageNames = async () => {
  const db = await MongoClient.connect(MONGO_URL);
  const collection = db.collection('PopularPackageNames_corp_check-local');
  await collection.deleteMany();
  await collection.insertMany(popularPackageNames.map(name => ({ name })));
};
