Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA5E7E5E1A
	for <lists@lfdr.de>; Wed,  8 Nov 2023 20:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BF49B20E7D
	for <lists@lfdr.de>; Wed,  8 Nov 2023 19:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB4A36B05;
	Wed,  8 Nov 2023 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0579934CFD;
	Wed,  8 Nov 2023 19:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE88BC433C7;
	Wed,  8 Nov 2023 19:04:11 +0000 (UTC)
Date: Wed, 8 Nov 2023 14:04:15 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Joe Perches <joe@perches.com>
Cc: Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev 
 <konstantin@linuxfoundation.org>, users@linux.kernel.org,
 ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231108140415.46f84baa@gandalf.local.home>
In-Reply-To: <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	<20231106110547.6956a430@gandalf.local.home>
	<280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
	<ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
	<6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 08 Nov 2023 10:16:15 -0800
Joe Perches <joe@perches.com> wrote:

> On Wed, 2023-11-08 at 16:44 +0000, Mark Brown wrote:
> > On Wed, Nov 08, 2023 at 08:19:46AM -0800, Joe Perches wrote:  
> > > On Mon, 2023-11-06 at 11:05 -0500, Steven Rostedt wrote:  
> > > > Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:  
> >   
> > > > > For this reason, I propose switching the "F: *" entry in MAINTAINERS 
> > > > > ("THE REST") to patches@lists.linux.dev instead. This list differs from LKML
> > > > > in the following important aspects:  
> >   
> > > > As long as it doesn't affect those that have L: linux-kernel@vger.kernel.org  
> >   
> > > > All core kernel changes should still go there.  
> >   
> > > >  (Scheduler, timing, tracing, interrupts, etc)  
> >   
> > > If this is done, perhaps half or more of the lkml
> > > mailing list entries in MAINTAINERS should be removed.  
> >   
> > > This grep shows all the section entries with
> > > 	L:	linux-kernel@vger.kernel.org
> > > most of which seem not "core".  
> > 
> > The suggestion wasn't to use LKML exclusively for core changs but rather
> > to not have LKML added for everything that has a more specific list.  
> 
> Likely you and I read Steven's suggestion differently.
> Perhaps Steven wants to clarify.

Right. For example, I use linux-trace-kernel@ to add patches to patchwork,
but I prefer the discussions to be done on LKML.

-- Steve

