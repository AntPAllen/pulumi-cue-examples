package s3

import "examples.pulumi.com/s3-bucket/pulumi/pulumi"

#BucketObject: {
	pulumi.#Resource
	type: "aws:s3:BucketObject"
	properties: {
		source: pulumi.#Asset
		acl:    string
		bucket: string
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
	ref: {
		id:              "${\(self.resourceName).id}"
		websiteEndpoint: "${\(self.resourceName).websiteEndpoint}"
		website: {
			indexDocument: "${\(self.resourceName).website.indexDocument}"
		}

	}
}