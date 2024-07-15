Return-Path: <ksummit+bounces-1411-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AA69310AA
	for <lists@lfdr.de>; Mon, 15 Jul 2024 10:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B03AB233EB
	for <lists@lfdr.de>; Mon, 15 Jul 2024 08:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2601849E9;
	Mon, 15 Jul 2024 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXL9+Eki"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836DB13B59B
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721033620; cv=none; b=C6UtJgYqPDa42r9i76ujdiZfI7Nt//2PltrUn/VqocYCAtHpg3HHNON9b/TqtMgouUBZaRJ04Itshi3VrZ1T13quOmOk9WhdoKXoOMmHZHXjKHXuWLSohicpNVt6dvQj11Y6jZTygqpy2t6YB1tFn2NA2k6WLvcyhc1lGK4DAEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721033620; c=relaxed/simple;
	bh=9KyACKOSJvJj5UYAW5Eh7wWqSaOKe90GICU+Y3BZPKc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FreRBd+ORRggMAHsRqqXbPd2bbOrcJjLe0LgXQrzW5kDyGL3WkOwhwgNEcaybIzKAGA4JGcpoqh9GlJghSY84XJUf0z/dc/8JfI1E8JAspccV3bkmAoH88X+SpW6DWRTLhw67+aRpEnPvpuE3hjwDougZcMR5Q2cOH6gqAY2Bqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXL9+Eki; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13894C32782;
	Mon, 15 Jul 2024 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721033620;
	bh=9KyACKOSJvJj5UYAW5Eh7wWqSaOKe90GICU+Y3BZPKc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SXL9+Eki/gWHHasMyV9gYdQ2gfX1CPWftTBPOwuaCKd8ewMnWPdGimmpNHTbgt6S+
	 CV1D+N5SSgSI00m3N9pMc5ohcWSg2nmEwtaMorviZVmiHqluUT7RFPL/MKechvM/Av
	 ELAXfNRQYipZK/kU/QjEn5N6ZyUevj3uW2EhYFGf2Uv/yQ6e42v1SnnIBIdZ3OIty7
	 26jh/zZrdZ9BTtw2nrT8kmBkMoIwwMiKSpak/O5vmjOHzDB3pY6OBXmdKtsiuGHtLs
	 ip7ypZxNoDlfEtxwc4KCG2tQLl4nXQvhodSzs2IsoR5BxopXvWY/50xJk9Vd4k6Roq
	 H85XG3OTOhpsg==
Date: Mon, 15 Jul 2024 10:53:36 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Sasha Levin <sashal@kernel.org>,
 ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <20240715105326.77fa37de@foz.lan>
In-Reply-To: <2024071528-cahoots-reacquire-9eab@gregkh>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	<CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
	<ZpQdJpKhIzmf3veU@sashalap>
	<CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
	<ZpQ0soWV6zIpgigf@sashalap>
	<0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
	<CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
	<2024071528-cahoots-reacquire-9eab@gregkh>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 15 Jul 2024 10:02:54 +0200
Greg KH <gregkh@linuxfoundation.org> escreveu:

> On Sun, Jul 14, 2024 at 04:09:06PM -0700, Linus Torvalds wrote:
> > On Sun, 14 Jul 2024 at 16:06, James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:  
> > >
> > > But we know how to enforce a unified view of process: we document it in
> > > Documentaion/process ...  
> > 
> > Hahhahhahaahh.
> > 
> > Ahh, you're such a kidder, James.  
> 
> Yeah, and that's the issue here, we have whole subsystems and many many
> maintainers and developers that do not follow this at all, hence our
> need to pull into stable commits that only have a "Fixes:" tag on it.
> 
> Now we can start running a bot on all submissions that says something
> like the one that I have been doing for the USB subsystem for the past
> few months, here's the text I use:
> 
> 	- You have marked a patch with a "Fixes:" tag for a commit that is in an
> 	  older released kernel, yet you do not have a cc: stable line in the
> 	  signed-off-by area at all, which means that the patch will not be
> 	  applied to any older kernel releases.  To properly fix this, please
> 	  follow the documented rules in the
> 	  Documentation/process/stable-kernel-rules.rst file for how to resolve
> 	  this.

Perhaps the text should also briefly describe how to make the bot ignore it
when there are good reasons for that. Something like:

	If the patch shall not be backported, please document it together
	with the rationale with:

	Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present

> But I doubt everyone wants to see that polute their mailing lists :(

As people learn about that, the number of such emails will reduce.


Thanks,
Mauro

