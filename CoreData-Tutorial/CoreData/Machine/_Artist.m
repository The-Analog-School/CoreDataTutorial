// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Artist.m instead.

#import "_Artist.h"

const struct ArtistAttributes ArtistAttributes = {
	.name = @"name",
};

const struct ArtistRelationships ArtistRelationships = {
	.albums = @"albums",
};

const struct ArtistFetchedProperties ArtistFetchedProperties = {
};

@implementation ArtistID
@end

@implementation _Artist

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Artist" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Artist";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Artist" inManagedObjectContext:moc_];
}

- (ArtistID*)objectID {
	return (ArtistID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic albums;

	
- (NSMutableSet*)albumsSet {
	[self willAccessValueForKey:@"albums"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"albums"];
  
	[self didAccessValueForKey:@"albums"];
	return result;
}
	






@end
