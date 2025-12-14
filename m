Return-Path: <ksummit+bounces-2673-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0A1CBB664
	for <lists@lfdr.de>; Sun, 14 Dec 2025 04:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4913300DA7B
	for <lists@lfdr.de>; Sun, 14 Dec 2025 03:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08332E1EF8;
	Sun, 14 Dec 2025 03:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qtuUhH5n"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447EC29B239;
	Sun, 14 Dec 2025 03:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765682861; cv=none; b=EgDFuqu+APiPeifnqKhg/1qbI2+NBlqFmbfsaZGOPTumtvrwil5i7XKgj8Z0mjIAks7uBUd157CpM/VKsTZ+nuVn8TVyninGcgBtz07Yp4pDK2gIl928TTHbzTy2zehM7ks+na0jiw8NFKPh8G1K7STkmKI776tMWs2962SfQrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765682861; c=relaxed/simple;
	bh=P2Z+/AQAc9l3yrYiwDGSasvicwDwY8z+0D3PszV4bi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFWvt+nlQgqbYWjSnQ0j5R+xAKkLKWyUX2do6vgGzAE/hPFTljlsG7WyN5XiKOXJWQ5iTT36RK3nmgAtqFJ0QGcufPyms39C0fEowQHjd5De3Zp3oFSvIonb29vSHRym0UjQ0eUuzPTDHlp1qszixc7+9gYhwrqT/r4GE7qs9/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qtuUhH5n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D243EC4CEF1;
	Sun, 14 Dec 2025 03:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765682860;
	bh=P2Z+/AQAc9l3yrYiwDGSasvicwDwY8z+0D3PszV4bi0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qtuUhH5ncdSkXi3WXiTCrBJr5gVom9GrWUhvgSQh+8VOhq2T6a8KwvwcOVF1k1Ec2
	 QbjMJdj5O3oI8mgRV9aG/ANbRjlsfP/2cJ/t/Fp5knTZtlYWvHTuCMkZYgxpCvwEJ7
	 vgRiRN06/KUK2mglbisH92Z0f6w5a8+Uq7xIqLyeOkLy31OsbkvIXsAuWr0obI3X5b
	 IhwfCNGhZ4Px9KMeu3htbuQTG+3FZgiOphgwLMe5e5NOwvCegrc8Xv7cmV7jVNx71/
	 NWNZA2XyQyEssxuAu0hhI9FHDdoRHgZIsn3QU0jcHmgy1mCA+vFHaQelThbb4+P4UY
	 IKm5kArxPTBpg==
From: Miguel Ojeda <ojeda@kernel.org>
To: ojeda@kernel.org
Cc: ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tab-elections@lists.linux.dev,
	tech-board-discuss@lists.linux.dev
Subject: 2025 LF Technical Advisory Board election - voting started
Date: Sun, 14 Dec 2025 04:27:16 +0100
Message-ID: <20251214032716.12886-1-ojeda@kernel.org>
In-Reply-To: <20251213030516.42855-1-ojeda@kernel.org>
References: <20251213030516.42855-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the end, we had nine nominations for this year's TAB election:

  - Alejandro Colomar
  - Cong Wang
  - David Hildenbrand
  - Greg Kroah-Hartman
  - Jiri Kosina
  - Julia Lawall
  - Matthew Wilcox
  - Steven Rostedt
  - Theodore Ts'o

Voting has begun, and everybody who is eligible for an automatic ballot,
or who has requested a ballot, should have received voting instructions
from the CIVS system.  If you were expecting a ballot and did not get
it, then:

  - Perhaps it ended up in your spam folder?

  - Have you enabled your email address in the CIVS system?  It will not
    send you anything until you have done that.  The place to enable an
    address is https://civs1.civs.us/cgi-bin/opt_in.pl

Please contact us at tab-elections@lists.linux.dev if you have
difficulties or questions.

Voting will remain open through December 20.

Thanks!

Cheers,
The LF TAB elections team

