Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC87E5EB2
	for <lists@lfdr.de>; Wed,  8 Nov 2023 20:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C28EB20D0F
	for <lists@lfdr.de>; Wed,  8 Nov 2023 19:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65B33715C;
	Wed,  8 Nov 2023 19:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA6637153;
	Wed,  8 Nov 2023 19:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBADC433C8;
	Wed,  8 Nov 2023 19:34:43 +0000 (UTC)
Date: Wed, 8 Nov 2023 14:34:47 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Joe Perches <joe@perches.com>
Cc: Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev 
 <konstantin@linuxfoundation.org>, users@linux.kernel.org,
 ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231108143447.12d73140@gandalf.local.home>
In-Reply-To: <985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	<20231106110547.6956a430@gandalf.local.home>
	<280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
	<ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
	<6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
	<20231108140415.46f84baa@gandalf.local.home>
	<985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 08 Nov 2023 11:14:45 -0800
Joe Perches <joe@perches.com> wrote:

> > Right. For example, I use linux-trace-kernel@ to add patches to patchwork,
> > but I prefer the discussions to be done on LKML.  
> 
> How would that work?  Especially with get_maintainer?

The way it works now. Just Cc both lists. What's the problem with that?

I use to only do discussions on LKML and have myself Cc'd (or Cc myself in
the discussions), but then I couldn't manage the patches from my inbox. So
I set up the mailing list and added that to be Cc'd too in MAINTAINERS, so
that everything goes to the other mailing list as well. That would then keep
the patches in patchwork, but the discussions would still be visible to the
general audience on LKML.


TRACING
M:      Steven Rostedt <rostedt@goodmis.org>
M:      Masami Hiramatsu <mhiramat@kernel.org>
L:      linux-kernel@vger.kernel.org
L:      linux-trace-kernel@vger.kernel.org
S:      Maintained


-- Steve

