Return-Path: <ksummit+bounces-967-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0CE77CB2D
	for <lists@lfdr.de>; Tue, 15 Aug 2023 12:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1EE81C20D45
	for <lists@lfdr.de>; Tue, 15 Aug 2023 10:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CFBCA61;
	Tue, 15 Aug 2023 10:34:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C013C1D
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 10:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B861EC433C8;
	Tue, 15 Aug 2023 10:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692095692;
	bh=hcERZyjRB4fzMtmynQJobf34wGombSiKO0PYBKsIlaM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HzkKNXsJTAxnAWWvj/u3eNNWh9Bls13Zg4BYoK6YhWnjZnrGoozi3t/1vuF7IX4wU
	 /lcul97OgdFIFD5FH0PynmN6txnAnDjaay7ZcTuVaLr0WpacLNjl/rbnpGWSiC1dIY
	 FZRR64CTwfDPr7t22HH1XsCzxt572Yky259IZHwV7p9yeIC0hBftFeW/e+1oNI5y/m
	 d/u7jNAtxxgpp+9B8D7sYwordLqaSMUmkikRAyAlMXMizSQzsvND4FmWQg4AjZYCkc
	 U/uO8AkdU9O7ptQdhvss8cYW0+CLVEkj5a6bJFXDpBt281h/qwIG23Lc16/U544gea
	 XUjIim0Du8x8w==
Date: Tue, 15 Aug 2023 12:34:49 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
In-Reply-To: <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
Message-ID: <nycvar.YFH.7.76.2308151226010.14207@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm> <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Aug 2023, Vegard Nossum wrote:

> I think it's worth pointing out that the latest update to the 
> documentation (where reporters are discouraged from reporting kernel 
> issues to linux-distros@ ever) came just after a private discussion (on 
> both mailing lists) about the StackRot/CVE-2023-3269 vulnerability where 
> Linus in particular came out hard against the linux-distros policy, in 
> particular the requirement to disclose PoCs if those were shared with 
> the list in the first place. I therefore think that Linus himself needs 
> to be involved in this discussion and that his arguments need to be made 
> in public instead of just paraphrased by me.

And I acutally agree with Linus there -- I see no huge value with POCs 
being shared there.

I know the linux-distros@ people would probably argue that POCs are 
required so that they can integrate them into their QA / CI / regression 
testing pipeline, but, quite honestly, I don't believe this is happening 
in reality anyway.

> > With my distro hat on, I really want the kernel security bugs to be
> > *eventually* processed through linux-distros@ somehow, for one sole
> > reason: it means that our distro security people will be aware of it,
> > track it internally, and keep an eye on the fix being ported to all of our
> > codestreams. This is exactly how this is done for all other packages.
> > 
> > I would be curious to hear about this from other distros, but I sort of
> > expect that they would agree.
> 
> +1 from me; the distros list has been an extremely important resource
> for distros in order to get fixes shipped out with minimal delay.
> 
> I keep saying this as well: almost all users get their kernels through
> distros. Very few end users build their own kernels from source; in
> other words, it's not enough that a fix has been committed to
> mainline/stable git to consider it fixed. The connection between
> upstream git and end users is clearly the distros, so distros should be
> in the loop _at some point_.

Thanks for underlying exactly my point here.

> I'll throw in another idea: distros@kernel.org.
> 
> A closed list which will be notified by security@kernel.org once they
> feel patches for a particular issue are ready for testing/consumption by
> distros (and hopefully before the issue is disclosed publicly, if the
> reporter still wishes to do that).
> 
> The members and list rules would be totally up to the security team to
> decide.

That might be a viable option as well. It'll be a little bit inconvenient 
for the distro security people to follow different sets of rules, but 
still better than current situation. They'll probably also want the 
"assign a CVE" process that currently works on linux-distros@, but that's 
doable. I can ask SUSE security people what they'd think about such an 
idea, input from others would also be welcome.

(and maybe, if the distros@ process really gets established, 
linux-distros@ will finally realize that they'd better adjust their 
process to accomodate kernel :) ).

Thanks,

-- 
Jiri Kosina
SUSE Labs


