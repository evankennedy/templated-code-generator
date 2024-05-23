import MyComponentService from './MyComponentService';

interface MyComponentProps {
	propA: string;
	propB: number;
	propC: boolean;
}

/**
 * This is my component. There are many others like it, but this one is mine.
 */
function MyComponent(props: MyComponentProps) {
	const service = new MyComponentService();
	return (
		<>
			This is complex!
			{service.doThing()}
		</>
	);
}
