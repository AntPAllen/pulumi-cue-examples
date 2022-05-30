package pulumi


#Resource: {
	type:         string
	resourceName: string
	properties: {[string]: _}
	...
}

#Up: {
	resources: [Name=string]: #Resource & {
		resourceName: Name
	}
	outputs: [string]: string
}

#StringAsset: {
	"Fn::StringAsset": string
}

#FileAsset:  {
	"Fn::FileAsset": string
}

#Asset: #StringAsset | #FileAsset