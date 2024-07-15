Return-Path: <ksummit+bounces-1409-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32491930DD9
	for <lists@lfdr.de>; Mon, 15 Jul 2024 08:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 475D31C20F75
	for <lists@lfdr.de>; Mon, 15 Jul 2024 06:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1643718410B;
	Mon, 15 Jul 2024 06:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+btjhPe"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863F526287
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 06:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721024134; cv=none; b=Yorl37Fhx6sOYcu2vS6nTG8+ua4qUzIjHdqSj8bbV5Lv0vd5wRbKhmhrh++/mvRw3gbaM4YvGENzguC5F/S962J9kR/M60mSTXcHkGK8IPNWuPKQwOmosZ79idazbebq8B5UnwKDTaM2mkOXVKNTkME8Mz9JNtlcF9nAhT5INgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721024134; c=relaxed/simple;
	bh=8gN0MIW97BLJaLHN5lSu5cZTom7xNG5E73ix2jOw/Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HWsMlD0gKxZxZV6LX2gGWC/CYGyq2D4b2CVD5jdyOAzGiZyZCiM19ndsWolwDQgPma846/mVU8b5nIT5Zi25dRyd0jK1PhRpMsjc+hjci+WWUmIrlCyFFx3vXStTabXbge9eh3ZndsG2xSLS6Neu5LG5t55QPookGuHrL4enu1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+btjhPe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424BEC4AF0B;
	Mon, 15 Jul 2024 06:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721024134;
	bh=8gN0MIW97BLJaLHN5lSu5cZTom7xNG5E73ix2jOw/Ao=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K+btjhPeTI68v292U/Z6Nfn2O3tTF4NqNicRnNdRfd85UNkZ06bVzUIYaZfveavDI
	 WT+mKp+Fkk6+fnUpCiZ+I60e5D2aiAq9ejscCsgOw0dlMDVlkOSR1Kn4jr4NSpsTPu
	 oWjTH1N8yIDqTX9s9BnUgt9EqxSaMhM7dGeF5CsyAFLFuIxmd6S+3pcLF+C0dcrAIH
	 i28pSjoGJpBweb4ledc+LXMEI7M1T7oBaSFSGwIUbNeTcynWn2e28bENnB115hY0YF
	 v/eNsBj4zDD+YMB4wcYfZbhREVTTCQA+/Y9DJ9OnUf0ueIH7IRcZOdiLYd691VljBU
	 g9Np11BJ7GoxA==
Date: Mon, 15 Jul 2024 08:15:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <20240715081504.28c0805b@foz.lan>
In-Reply-To: <ZpQbQa-_8GkoiPhE@sashalap>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	<915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
	<ZpQbQa-_8GkoiPhE@sashalap>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 14 Jul 2024 14:38:57 -0400
Sasha Levin <sashal@kernel.org> escreveu:

> On Sun, Jul 14, 2024 at 09:35:26AM -0400, James Bottomley wrote:
> >On Sun, 2024-07-14 at 08:31 -0400, Sasha Levin wrote:  
> >> Hi folks,
> >>
> >> To address these shortcomings, I propose
> >> introducing an "Improves tag" (Improves: 012345678901 ("commit
> >> subject")) and altering the meaning of the Fixes tag.  

I don't think that a "Improves tag" would solve anything.

> All our documentation explicitly says that a stable tag is a *must*,
> we've been nagging folks to add it when they haven't, and we give them
> the spiel whenever we're asked why a certain fixes-only commit didn't
> make it into the stable trees.

Agreed.

> > So the clear rules look like they should be
> >
> >   1. every patch fixing something should have a fixes tag pointing to
> >      the fixed commit
> >   2. Only patches with cc:stable should go automatically in to stable
> >      trees and as far back as the fixes tag allows
> >   3. if a patch without cc:stable is later discovered to be a required
> >      fix, people can ask for it to be backported.  
> 
> These were the rules for a while, and the issue was that there were so
> many commits without a stable tag that needed to be backported that the
> model of "later discovered" simply overwhelmed the process.
> 
> We can't go back to that again.

In my case, I use to explicitly c/c stable when I feel the need of a
backport and I'm confident enough that the patch won't cause any
regressions. 

I use fixes on all sorts of fixes, including some that might
change behavior or eventually cause regressions. So, better not
hush backporting them.

There are some border cases though. For instance, patches adding new
PCI/USB IDs to drivers aren't technically fixes[1]. They're just usual
driver maintenance to support newer models (I'm considering the case
where the chipset is the same). Sometimes, those are not too trivial 
(just add new IDs to the id tables), as they may require some extra 
logic to properly setup resources like irqs, gpios, PM lines, etc.

If we had a new "improves" tag, I would be in doubt on such patches
about tagging them or not, as technically it is not an improvement 
either, as the driver itself didn't require any changes, except for 
the model-dependent resource allocation logic.

Still, they make sense to be backported on distros, as it may solve
use case problems of devices not being properly detected, thus closing
bugs at the distros bug tracking systems. (so, they're "Fixes" from
distro standpoint).

[1] some people still consider them fixes against the initial driver
    submission, even if the device model to be added didn't exist at
    the time the driver was written.

Thanks,
Mauro

