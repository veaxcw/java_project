import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

public class Start {

	public static void main(String[] args) {
		try {
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		}catch(ClassNotFoundException | InstantiationException | IllegalAccessException | UnsupportedLookAndFeelException e) {
			e.printStackTrace();
		}
		System.out.println("测试");
		new Frame();


	}

}
