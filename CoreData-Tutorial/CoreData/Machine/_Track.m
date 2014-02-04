// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Track.m instead.

#import "_Track.h"

const struct TrackAttributes TrackAttributes = {
	.name = @"name",
};

const struct TrackRelationships TrackRelationships = {
	.album = @"album",
};

const struct TrackFetchedProperties TrackFetchedProperties = {
};

@implementation TrackID
@end

@implementation _Track

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Track" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Track";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Track" inManagedObjectContext:moc_];
}

- (TrackID*)objectID {
	return (TrackID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic album;

	






@end
