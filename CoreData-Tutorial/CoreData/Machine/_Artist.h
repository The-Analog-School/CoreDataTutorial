// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Artist.h instead.

#import <CoreData/CoreData.h>


extern const struct ArtistAttributes {
	__unsafe_unretained NSString *name;
} ArtistAttributes;

extern const struct ArtistRelationships {
	__unsafe_unretained NSString *albums;
} ArtistRelationships;

extern const struct ArtistFetchedProperties {
} ArtistFetchedProperties;

@class Album;



@interface ArtistID : NSManagedObjectID {}
@end

@interface _Artist : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ArtistID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *albums;

- (NSMutableSet*)albumsSet;





@end

@interface _Artist (CoreDataGeneratedAccessors)

- (void)addAlbums:(NSSet*)value_;
- (void)removeAlbums:(NSSet*)value_;
- (void)addAlbumsObject:(Album*)value_;
- (void)removeAlbumsObject:(Album*)value_;

@end

@interface _Artist (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveAlbums;
- (void)setPrimitiveAlbums:(NSMutableSet*)value;


@end
