Return-Path: <ksummit+bounces-2671-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C25CBA3D0
	for <lists@lfdr.de>; Sat, 13 Dec 2025 04:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E155306B14F
	for <lists@lfdr.de>; Sat, 13 Dec 2025 03:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713E12F39B5;
	Sat, 13 Dec 2025 03:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRkyNmm6"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEF4AD24;
	Sat, 13 Dec 2025 03:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765595131; cv=none; b=O+uT/3HPUKhByaGtzQFiYk8PRGFQPzPE4DndSlXYCjf5J7leQQ+VF0xNSHyXoXYAlHZ4KAKcscxVrS+YNpErfxF9cotYq1R6oaVUN1wPsBBTCxnSb04S5ElYagbJi3drZ5/4yuSskEI3w45zizTUVlJslTFaef51DTOTOMmVFec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765595131; c=relaxed/simple;
	bh=n78jPLw5i4Kjx3gG3XSKYlzIzlY4sun9zK1mzN+3JGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ax4z+ss0h+fN3xZGLkfojXYOVpUjLysIln/OLkKSvWk03YfFrw6ryPLTHlyuYx9RQhckkdx7pltjQ+1ac/0KekSEJCKkF9ag2ELz08ohPuVnzXltoDWoe2bXy+nFIFn25dp8TUwepfMTs571bPykUsVlGufD5/L+DGETfQCWuac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRkyNmm6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8819FC4CEF1;
	Sat, 13 Dec 2025 03:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765595130;
	bh=n78jPLw5i4Kjx3gG3XSKYlzIzlY4sun9zK1mzN+3JGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fRkyNmm6w7J/b10KK52PYdDlR9jIniPwLusio/mqH8W6IS5xPrvakVRy0BzqHCIQm
	 qmrFeI02mb8d62NGyUlFaOVQRr7k5AdZAtymUoWzrk9UvtYpWWQoqYnYcYDZnIUrrJ
	 a/GYCVzq7TePOcN6aSlkpO2mxGqAV+NW1Z5Sq9pmVKzyoz76+Wt9IDJsgtjqmVT7kn
	 3qJAZOOQzgzpriEP5Y6XmHM1DPuf0HoosPOm7BWCMwm8f8q5/4jjyPoCG6fWmQWlgs
	 paRLz8A9HmoFOqwnVlaZNGdP8ieLUceTiyHD5s+8TZH84nXVVFxBya7vuuvYiyxHII
	 dhy7b/mEtabZA==
From: Miguel Ojeda <ojeda@kernel.org>
To: ojeda@kernel.org
Cc: ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tab-elections@lists.linux.dev,
	tech-board-discuss@lists.linux.dev
Subject: 2025 LF Technical Advisory Board election - final reminder
Date: Sat, 13 Dec 2025 04:05:16 +0100
Message-ID: <20251213030516.42855-1-ojeda@kernel.org>
In-Reply-To: <20251205110541.2174201-1-ojeda@kernel.org>
References: <20251205110541.2174201-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One last reminder: the 2025 election for members of the Linux Foundation
Technical Advisory board will run from December 13 through 20.  For the
previous announcement with the details, see:

  https://lore.kernel.org/all/20251122004147.1655175-1-ojeda@kernel.org/

The call for candidates will close later today, and voting will start
afterwards (the exact timing will depend on when things finish up at
the Linux Plumbers Conference).

Everybody who is eligible for an automatic ballot or who has requested
one will receive a notification from the CIVS system once voting begins --
but only if you have enabled your email address with CIVS at:

  https://civs1.civs.us/cgi-bin/opt_in.pl

The list of candidates for the five open seats is currently:

  Alejandro Colomar
  Cong Wang
  David Hildenbrand
  Greg Kroah-Hartman
  Jiri Kosina
  Julia Lawall
  Steven Rostedt

But there is still time to put your name in if you are interested --
serving on the TAB is a unique opportunity to help the community.

Thanks!

Cheers,
The LF TAB elections team

