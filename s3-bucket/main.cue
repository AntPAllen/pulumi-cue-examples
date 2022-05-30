package main
import (
 "examples.pulumi.com/s3-bucket/pulumi/pulumi"
 "examples.pulumi.com/s3-bucket/pulumi/aws/s3"
)

pulumi.#Up & {
	resources: {
		myBucket: s3.#Bucket & {
			properties: website: indexDocument: "index.html"
		}
		"index.html": s3.#BucketObject & {
			properties: {
				bucket: myBucket.ref.id
				source: "Fn::StringAsset": "<h1>Hello, world!</h1>"
				acl:    "public-read"
			}
		}
	}
	outputs: {
		bucketEndpoint: "http://\(resources.myBucket.ref.websiteEndpoint)"
	}
}
