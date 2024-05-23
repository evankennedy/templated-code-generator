import MyComponentService from './MyComponentService';

interface MyComponentProps {
	propA: string;
}

/**
 * This is my component.
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
