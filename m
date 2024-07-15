Return-Path: <ksummit+bounces-1417-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0DF931758
	for <lists@lfdr.de>; Mon, 15 Jul 2024 17:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E70881F22641
	for <lists@lfdr.de>; Mon, 15 Jul 2024 15:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1867B18F2C5;
	Mon, 15 Jul 2024 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="rVYwOx0K";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="rVYwOx0K"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EF83A1A0
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721056055; cv=none; b=rn8W2VxqbBnR9RC3i339l40gTL8ESYgFf7LWaQ4ud/07XmxHtMi3nVQT3B/P7gU7OVaHTXsy7XkAnhqQT3ZxQJIFeuBU6bOGKs12nFXNxyld8hbblTrLfRhHuiKsL8zNX7GPA6J9l4G0oZ+ot42TX3Oji5rsS3YEBna7+Xktz6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721056055; c=relaxed/simple;
	bh=Z3D+6QuIN/6Dhz1afQdlil7SxBEDcpDyaGxXG4KS19g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JcCJeRNfLmpLakIgb8Ze41R/W7a9pxqhYKpdaMgaHCevqJDCLd75RueYuWqkIkTXFyo7ZhWgSiB2wxaqc/0IDJsKc6+/Yuvlox4QTK22zpwLWMZgMvrjrFKlM1fMxk5OXGmBVb/dY8Kg8guDkVWIO0dQIsnL2tkDesPDihlnEI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=rVYwOx0K; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=rVYwOx0K; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721056053;
	bh=Z3D+6QuIN/6Dhz1afQdlil7SxBEDcpDyaGxXG4KS19g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=rVYwOx0KAv5JgGY+sh4E2px2S1Xh0W9KNEdExk1/XVQbMmnZokULO2L5/+KTuyDip
	 fc1OVtTyvwnC62FJzyalOOA0RoLzrkUN+4OJ1NfvN/cC++lFyiKl+YE1BSiaskUkoK
	 GJ6SjtcKqNY2jPKxFQKx/ixL5w/Jac29nvmpPwPQ=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 3BA351285D06;
	Mon, 15 Jul 2024 11:07:33 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id m0mAwGHNOEoA; Mon, 15 Jul 2024 11:07:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721056053;
	bh=Z3D+6QuIN/6Dhz1afQdlil7SxBEDcpDyaGxXG4KS19g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=rVYwOx0KAv5JgGY+sh4E2px2S1Xh0W9KNEdExk1/XVQbMmnZokULO2L5/+KTuyDip
	 fc1OVtTyvwnC62FJzyalOOA0RoLzrkUN+4OJ1NfvN/cC++lFyiKl+YE1BSiaskUkoK
	 GJ6SjtcKqNY2jPKxFQKx/ixL5w/Jac29nvmpPwPQ=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 7AC5B1281F7B;
	Mon, 15 Jul 2024 11:07:32 -0400 (EDT)
Message-ID: <b71b6745ae79ae40196d82c0c306acdc174c0994.camel@HansenPartnership.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Jonathan Corbet <corbet@lwn.net>, Greg KH <gregkh@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, Linus Torvalds
	 <torvalds@linux-foundation.org>, Sasha Levin <sashal@kernel.org>, 
	ksummit@lists.linux.dev
Date: Mon, 15 Jul 2024 11:07:30 -0400
In-Reply-To: <87h6cqya32.fsf@trenco.lwn.net>
References: 
	<CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
	 <ZpQdJpKhIzmf3veU@sashalap>
	 <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
	 <ZpQ0soWV6zIpgigf@sashalap>
	 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
	 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
	 <2024071528-cahoots-reacquire-9eab@gregkh>
	 <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
	 <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
	 <202407151434198c3715e9@mail.local>
	 <2024071515-zestfully-womankind-1901@gregkh>
	 <87h6cqya32.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2024-07-15 at 09:00 -0600, Jonathan Corbet wrote:
[...]
> So, to me, the real question here is: what is the actual policy?

This thread does demonstrate huge confusion around that.  I'd really
like to try to run with what's documented because that's the easiest
for Maintainers to enforce.

> Are developers and maintainers expected to put in stable tags the way
> they are expected to add Signed-off-by, or is it a fully optional
> practice? In the latter case, I'm not sure how much good messing with
> the tags will do.

So what's documented is

Fixes: is generally useful outside of stable (for bug tracing and the
like) and is thus not optional.  It simply means something about the
target was updated by the patch, but this could be spelling in comments
or white space and thus may not be a stable candidate.

cc:stable is only for trees opting in to the stable process to mark
commits that should be backported (i.e. is optional).

Backport requests for upstream commits that didn't get a cc:stable tag
go to the stable list, but I'll look into improving the automation
around it.

James

