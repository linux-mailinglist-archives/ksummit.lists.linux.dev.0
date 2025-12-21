Return-Path: <ksummit+bounces-2680-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC291CD405C
	for <lists@lfdr.de>; Sun, 21 Dec 2025 13:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97391300C0F8
	for <lists@lfdr.de>; Sun, 21 Dec 2025 12:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C91286D4E;
	Sun, 21 Dec 2025 12:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwTYzpre"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D63A1B5;
	Sun, 21 Dec 2025 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766321552; cv=none; b=jRZpG6GGycC6wYyBuuGju35VMd0kyAj/yW487YgMPp/2i5GVzuM88Byz+g2/thQGh2SipINxsLC41lyzMbgIVV7wtzjrELn19XFIlsuLYEUZSE5/16sLOrvVbr49ztr5K7YV0PbYBZ2WDySGv4DkXPdGPKTBC9hEeYPPMppURxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766321552; c=relaxed/simple;
	bh=CA2hmjKkRG3mQVoyidQkY+JH9tkrlZoyyk8kU6l3lIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z541ogpSfD4xgJaQft56Zu8GT2EawizLSOpwFxK8wg//iGH0xaTMptrSVE/Ldmpi4mciCYG6F4+6KYZDvRi6gAthjlNu0TtsZqQ3EF52NyKSpq5bULErSy42Pn3VK/cp7IFYZuaw/VidfksSFcE5ISF23SwsDgFPz6HTlUuAGFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwTYzpre; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3BDC4CEFB;
	Sun, 21 Dec 2025 12:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766321551;
	bh=CA2hmjKkRG3mQVoyidQkY+JH9tkrlZoyyk8kU6l3lIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hwTYzpreHtW6isxBd4L4J60+pDjpRhTNN/NeZkP6wcAlKJNVIYqurRGYh+jvZ18aK
	 LbEyD3cIdAlPnQ88nevEuCNwWlIK+OgbYfMRSBGKKTwr6Y9uGpmN0wXAHokXdSVnc/
	 5ifqOHarKWGQ3RA9ZnZIv6ipTtwehcOngaQX9gFdoIBgevjuT+JC42L2cJMnW+TTUQ
	 3ITj4qJivJUsr+W+5F5ri3EnMw20nuNfVjKoA+CzpfYsBxBYQcTG8rIcvRQbJViCGp
	 T9tMa5VOSzUheE7VKKjnuqxbN2yRfNxDDeWdNWB5n+1ADJ08TUM0txFpy0t6qhhA5P
	 T09xY+J3yE+nQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: ojeda@kernel.org
Cc: ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tab-elections@lists.linux.dev,
	tech-board-discuss@lists.linux.dev
Subject: 2025 LF Technical Advisory Board election - results
Date: Sun, 21 Dec 2025 13:52:06 +0100
Message-ID: <20251221125206.99296-1-ojeda@kernel.org>
In-Reply-To: <20251220140205.43515-1-ojeda@kernel.org>
References: <20251220140205.43515-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There were 1054 registered voters in this year's TAB election; 265 of
them cast ballots.  The results were (with the top five being elected):

     1. Greg Kroah-Hartman
     2. Steven Rostedt
     3. Julia Lawall
     4. David Hildenbrand
     5. Theodore Ts'o
    -----------------------
     6. Jiri Kosina
     7. Matthew Wilcox
     8. Cong Wang
     9. Alejandro Colomar

Thanks to everybody who voted and to the candidates for putting their
names forward, and congratulations to those elected!

Cheers,
Miguel

