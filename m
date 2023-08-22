Return-Path: <ksummit+bounces-1043-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE555783B14
	for <lists@lfdr.de>; Tue, 22 Aug 2023 09:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 846D728100F
	for <lists@lfdr.de>; Tue, 22 Aug 2023 07:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D438466;
	Tue, 22 Aug 2023 07:41:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4746979EF
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 07:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CFBC433C7;
	Tue, 22 Aug 2023 07:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692690085;
	bh=CChEJ+FrddK2N9YujedMNtVzBjeRY2kyLrzj4KneCgU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LflmWOyoLpJxtUoHwmiLyy3ChOWFpZZStED66ETTi+ggGUREcqwwhykNGY6BAYdHG
	 yImlusPr8XKTasxJh2qD/8NYvwYMA0gpa6PMKk+3NK6LXWi2pzyfq4UfrNL6B1rkRN
	 SnB127wJ11pKRE9aMgkhUK+xctrDrSmhVdpvLmed+d3X/Wi0xuHXzimwG0shxeLHfo
	 /txmzeFdBPd4fiCJeRWNlE3sfluHyMQ+s1lPV9uPtWmMRnARZ9t0zQSljpAUTb3JZq
	 KxCg6yt5wHfenBECucJmlksAER5mlR20BKwEdiFC0acm9FE08LX81Ew3Znm6rzpPD8
	 vdK/3Zw3dYpvA==
Date: Tue, 22 Aug 2023 09:41:20 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
cc: Leon Romanovsky <leon@kernel.org>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Jakub Kicinski <kuba@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
    Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
    Andrew Lunn <andrew@lunn.ch>, Luis Chamberlain <mcgrof@kernel.org>, 
    Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev, 
    Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
In-Reply-To: <20230821153549.GJ10135@pendragon.ideasonboard.com>
Message-ID: <nycvar.YFH.7.76.2308220938500.14207@cbobk.fhfr.pm>
References: <20230816180808.GB2919664@perftesting> <ZN0uNrpD8JUtihQE@bombadil.infradead.org> <20230817093914.GE21668@pendragon.ideasonboard.com> <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch> <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com> <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com> <20230818080949.7b17b0d5@kernel.org> <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <20230819064537.GM22185@unreal> <20230821153549.GJ10135@pendragon.ideasonboard.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Aug 2023, Laurent Pinchart wrote:

> > It is not clear to me how to get honest answers without fear of 
> > loosing an ability to work with that subsystems later.
> 
> One straightforward (on paper) option is to guarantee anonymity. When I 
> was in university, students were given the opportunity to provide 
> feedback on teachers, and the feedback was aggregated into a report that 
> didn't contain any personal information that could be used to identify 
> the students.

I understand where you are coming from with this (my university did the 
same :) ), but in my view this has a huge potential for not really 
reflecting reality. Rationale being: the people who e.g. got their code 
rejected will naturally tend to provide negative feedback, even if 
rejecting the code was objectively the right thing to do.

And vice versa.

Thanks,

-- 
Jiri Kosina
SUSE Labs


