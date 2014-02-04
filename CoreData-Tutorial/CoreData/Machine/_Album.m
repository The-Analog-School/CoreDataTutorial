// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Album.m instead.

#import "_Album.h"

const struct AlbumAttributes AlbumAttributes = {
	.name = @"name",
	.releaseDate = @"releaseDate",
};

const struct AlbumRelationships AlbumRelationships = {
	.artist = @"artist",
	.tracks = @"tracks",
};

const struct AlbumFetchedProperties AlbumFetchedProperties = {
};

@implementation AlbumID
@end

@implementation _Album

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Album" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Album";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Album" inManagedObjectContext:moc_];
}

- (AlbumID*)objectID {
	return (AlbumID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic releaseDate;






@dynamic artist;

	

@dynamic tracks;

	
- (NSMutableOrderedSet*)tracksSet {
	[self willAccessValueForKey:@"tracks"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"tracks"];
  
	[self didAccessValueForKey:@"tracks"];
	return result;
}
	






@end
