import MyComponentService from './MyComponentService';

interface MyComponentProps {
	propA: string;
}

function MyComponent(props: MyComponentProps) {
	const service = new MyComponentService();
	return (
		<>
			This is complex!
			{service.doThing()}
		</>
	);
}
