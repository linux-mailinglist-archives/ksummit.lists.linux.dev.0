Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E47E6E09
	for <lists@lfdr.de>; Thu,  9 Nov 2023 16:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99AED1F214C8
	for <lists@lfdr.de>; Thu,  9 Nov 2023 15:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931BE208D0;
	Thu,  9 Nov 2023 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9284208A0;
	Thu,  9 Nov 2023 15:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B330C433C7;
	Thu,  9 Nov 2023 15:51:09 +0000 (UTC)
Date: Thu, 9 Nov 2023 10:51:12 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231109105112.46d65fcd@gandalf.local.home>
In-Reply-To: <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	<20231106110547.6956a430@gandalf.local.home>
	<280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
	<ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
	<6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
	<20231108140415.46f84baa@gandalf.local.home>
	<eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Nov 2023 11:32:16 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Wed, Nov 08, 2023 at 02:04:15PM -0500, Steven Rostedt wrote:
> > 
> > Right. For example, I use linux-trace-kernel@ to add patches to patchwork,
> > but I prefer the discussions to be done on LKML.
> >   
> 
> I had no idea that how tracing worked...  I normally strip out mailing
> lists from my patches if I think they're not necessary so I seldom CC
> lkml.  In years past, there used to be a lot of complaining about CC'ing
> too many people so I try to trim the CC list when I send patches.

You usually just send fixes, which is fine for not Cc'ing LKML.

Please do not strip linux-trace-kernel, though. As it keeps the responses
in patchwork.

> 
> Networking doesn't need to be CC'd about wireless patches.
> Drm doesn't need to be CC'd about amd gpu driver patches.
> 
> And for bug reports, I only ever CC one lore mailing list.  (For zero
> day bot stuff, the bot chooses the CC lists).

Which is fine.

I'm care more about new features, as tracing / scheduling / etc affect the
entire kernel. Changes in DRM usually only affect DRM. But a scheduling or
tracing change, could affect DRM, which is why I want to keep those patches
going to the generic mailing list.

-- Steve

