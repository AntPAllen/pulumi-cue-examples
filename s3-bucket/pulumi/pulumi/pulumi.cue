package pulumi

#Resource: {
	type:         string
	resourceName: string
	properties: {[string]: _}
	create: _
	...
}

#Up: {
	cue: [Name=string]: #Resource & {
		resourceName: Name
	}
	resources: {
		for k, v in cue {
			"\(k)": v.create
		}
	}
	outputs: [string]: string
}

#StringAsset: {
	"Fn::StringAsset": string
}

#FileAsset: {
	"Fn::FileAsset": string
}

#Asset: #StringAsset | #FileAsset
