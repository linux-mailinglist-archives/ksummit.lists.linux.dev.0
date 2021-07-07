Return-Path: <ksummit+bounces-277-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id CD50B3BE243
	for <lists@lfdr.de>; Wed,  7 Jul 2021 06:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 5C4F23E0F9A
	for <lists@lfdr.de>; Wed,  7 Jul 2021 04:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66E82FAD;
	Wed,  7 Jul 2021 04:57:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416372
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 04:57:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E146A619A9;
	Wed,  7 Jul 2021 04:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625633866;
	bh=LBlvCHdnlFfoln54uOR10DgIIG+ZQ00jDNN2AkKZ+PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pCkZxyu7eqd+JncTVf27N3XR+Tn72p+iDGbLN/LV2Pt3XnMDO3A5jCHLWF4q/sEL5
	 qxDI8QDmfwWsU8/uaEMdcSatBwVOI6OiARdgySC8V3lFwUw2j0iuq9RH7ixGGtE6cK
	 3LyJ+jn8XQ768rqb7XLDSOdrOazBg2o+EdREf6OOrYp1RWPocHG7NY/hcSvXSv21fO
	 x6Ai45TWjt/jvAwaIU67/R52XxkY2O44vfbG/v/h8bi71xkVyV1SigOYbpgrf573i1
	 HRXAklOUsU+XVSkZv245mSCQx8jlI3CsK9sgssIPa8x310TlHGKOhyDQLgdYLEs4fY
	 OpXetDrUNactg==
Date: Wed, 7 Jul 2021 07:57:42 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOU0Rqoty8ycRhQT@unreal>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
 <YORwwQJfrpNQsGT4@sashalap>
 <CANiq72n=_LG3z8-JYVSiNeM8PgxauPh5_xjfY1hY_gnJaGsYng@mail.gmail.com>
 <YOSmkgFpSUWtf2ue@sashalap>
 <CANiq72keYwLBY7_nRUN5RTxhQATgsi=LpYsCb59Zv+D4sg=iDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72keYwLBY7_nRUN5RTxhQATgsi=LpYsCb59Zv+D4sg=iDg@mail.gmail.com>

On Tue, Jul 06, 2021 at 11:50:51PM +0200, Miguel Ojeda wrote:
> On Tue, Jul 6, 2021 at 10:47 PM Sasha Levin <sashal@kernel.org> wrote:

<...>

> > That's quite an ask. If the driver work goes in and I want to touch the
> > driver API, I need to get Greg KH to write code for me?
> 
> I have not said that, and that obviously that does not scale. I am
> just stating what I think could help everyone during the transition
> period, assuming we share a common goal and accept Rust into the
> kernel.

I suggest to go one step further and loose expectation/requirement of
"you break, you fix" rule for the Rust code.

Any developer who does refactoring outside of the Rust-enabled subsystem
can simply leave that subsystem broken and relevant maintainers will fix
it later if they want.

We did it with staging in the fun days when Lustre was in the tree.
https://lore.kernel.org/linux-rdma/20150813055450.GA19344@infradead.org/
https://lore.kernel.org/linux-rdma/20150807141929.GA12442@infradead.org/

Thanks

> 
> Cheers,
> Miguel

