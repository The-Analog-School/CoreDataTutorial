// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Track.h instead.

#import <CoreData/CoreData.h>


extern const struct TrackAttributes {
	__unsafe_unretained NSString *name;
} TrackAttributes;

extern const struct TrackRelationships {
	__unsafe_unretained NSString *album;
} TrackRelationships;

extern const struct TrackFetchedProperties {
} TrackFetchedProperties;

@class Album;



@interface TrackID : NSManagedObjectID {}
@end

@interface _Track : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TrackID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Album *album;

//- (BOOL)validateAlbum:(id*)value_ error:(NSError**)error_;





@end

@interface _Track (CoreDataGeneratedAccessors)

@end

@interface _Track (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (Album*)primitiveAlbum;
- (void)setPrimitiveAlbum:(Album*)value;


@end
