package s3

import "examples.pulumi.com/s3-bucket/pulumi/pulumi"

#BucketObject: self={
	type: "aws:s3:BucketObject"
	pulumi.#Resource
	properties: {
		source: pulumi.#Asset
		acl:    string
		bucket: string | #Bucket
		bucketKeyEnabled?: bool
	}
	bucketKeyEnabled: "${\(self.resourceName)}.bucketKeyEnabled"
	create: {
		type:         self.type
		resourceName: self.resourceName
		properties:   self.properties
	}
}
#Bucket: self={
	pulumi.#Resource
	type: "aws:s3:Bucket"
	properties: {
		website: {
			indexDocument: string
		}

	}
	id:              "${\(self.resourceName)}.id"
	websiteEndpoint: "${\(self.resourceName)}.websiteEndpoint"
	create: {
		type:         self.type
		resourceName: self.resourceName
		properties: self.properties
	}
}
