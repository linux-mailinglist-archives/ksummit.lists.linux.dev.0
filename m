Return-Path: <ksummit+bounces-1416-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F49931744
	for <lists@lfdr.de>; Mon, 15 Jul 2024 17:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EE75B22370
	for <lists@lfdr.de>; Mon, 15 Jul 2024 15:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6011518C18C;
	Mon, 15 Jul 2024 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hYbSWlsB"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A1F2AD31
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721055609; cv=none; b=hB3J3WW0DIylykjIGq+VV0DcR5RTwvJkspXpPdAoY/13t2M7hyiSeJNvi2isnJfdiwRCGu2Hl3iyNQcruXr9cImctRG2tiORXeDa0bE625g8AXvqg0dBgWG61B0Dw9TPC3b5dSPT6X8mFNFwe26WCCydSvRgZLcZ7HWih/o1Rn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721055609; c=relaxed/simple;
	bh=HYxvfx6i0EdAvYRx/lvoSOaXftd48yBTk/xajthOZ0c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Of0m2N0qccPzr2eKLcITATSjqWQKZ0O7RTSRAnil1mGsf953Zo7S9aNNt1GfpC4tfpovSZn7b+YBumvd7axV6Q7NWzaZzebbL4VrYpMhz9Ffm1QaVABEVHSEyOaJYRoVQY7FUI9ysFN/oKDuF0cr04vYZbnBGsQpGVrh3MAD6KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hYbSWlsB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3B75141A2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1721055602; bh=9vFG1JikkWg5gG97WnELDJP28rKqzBtpnZTdW2qKvTs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hYbSWlsBA8q5clXFPHAqSX8FhGHPy8XEDq235aIONweUYkPsCwxOy4gV5m9GOCNTi
	 VPfpr2Gp3ENOhiL3BJRvWDRzradyoQqfAwRrEqTGwE+sx+WXZC26smlVT+HteSjJrU
	 BhJlr6GZKnQ7MwC389NMpzj9+Uu6Z5ewESRIhIfDvzjLsabTRGc+lBlkJx0h2aBvyf
	 0Iumv0VP4NUjwuQSicpswEPEmzJknjCzxZDPg6pQ1z3HrXQ8UU2cB8zuPwfXwgpgWn
	 qMrhKEbvb2DZvgyXlORPbcOcRrZQqKr4DluY9no+DF2oR8S7XLMsxGULMP9iVrFPiv
	 ljT6FOBenJJmA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3B75141A2D;
	Mon, 15 Jul 2024 15:00:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Greg KH <gregkh@linuxfoundation.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Sasha Levin <sashal@kernel.org>,
 ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
In-Reply-To: <2024071515-zestfully-womankind-1901@gregkh>
References: <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
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
Date: Mon, 15 Jul 2024 09:00:01 -0600
Message-ID: <87h6cqya32.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Greg KH <gregkh@linuxfoundation.org> writes:

> On Mon, Jul 15, 2024 at 04:34:19PM +0200, Alexandre Belloni wrote:
>> I'm very surprised that it didn't cross anyone's mind yet that
>> contributors and maintainers don't bother using Cc: stable because they
>> don't care about stable for various reasons. So the behaviour is nether
>> good nor bad and doesn't have to be penalized.
>
> Totally true.  The first rule of the stable tree is "it will not put
> additional burden on any developer or maintainer that doesn't want to
> participate in it."  So if you don't want to deal with it, wonderful,
> don't take anything and just don't worry about it.

I must confess I've been wondering about this, since I've seen the above
policy expressed a number of times over the years.  Stable participation
is entirely optional.  But then this conversation has included things
like:

> All our documentation explicitly says that a stable tag is a *must*,
> we've been nagging folks to add it when they haven't, and we give them
> the spiel whenever we're asked why a certain fixes-only commit didn't
> make it into the stable trees.

Sasha, https://lore.kernel.org/all/ZpQbQa-_8GkoiPhE@sashalap

> Anyway, if people want to stick to the current, documented, process,
> great, but as-is, trying to get people to follow that is rough and not
> really working.

Greg, https://lore.kernel.org/all/2024071528-cahoots-reacquire-9eab@gregkh

So, to me, the real question here is: what is the actual policy?  Are
developers and maintainers expected to put in stable tags the way they
are expected to add Signed-off-by, or is it a fully optional practice?
In the latter case, I'm not sure how much good messing with the tags
will do.

Thanks,

jon

