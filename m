Return-Path: <ksummit+bounces-1198-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8D07E5FBE
	for <lists@lfdr.de>; Wed,  8 Nov 2023 22:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C4461C20C38
	for <lists@lfdr.de>; Wed,  8 Nov 2023 21:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76850374DD;
	Wed,  8 Nov 2023 21:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8516610D;
	Wed,  8 Nov 2023 21:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B991CC433C8;
	Wed,  8 Nov 2023 21:11:12 +0000 (UTC)
Date: Wed, 8 Nov 2023 16:11:16 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>,
 users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]Re: [workflows]RFC: switching "THE REST" in
 MAINTAINERS away from linux-kernel@vger.kernel.org
Message-ID: <20231108161116.6806fc09@gandalf.local.home>
In-Reply-To: <onqqlmhfzvw7xcrssntrhkykq3hxxabrswo4c5tiekjlvbzxkc@mqm4yrwthmko>
References: <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
	<6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
	<20231108140415.46f84baa@gandalf.local.home>
	<985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
	<20231108143447.12d73140@gandalf.local.home>
	<20231108150749.13b7a0ee@gandalf.local.home>
	<fe239ff5c15403e418937cf23723017a803ec507.camel@perches.com>
	<bc0462f8119f83495ad35b2efdfd818797effb32.camel@perches.com>
	<88a5fb768bee48db508c366a0110e88b193d59a3.camel@perches.com>
	<20231108155606.4e73fdd5@gandalf.local.home>
	<onqqlmhfzvw7xcrssntrhkykq3hxxabrswo4c5tiekjlvbzxkc@mqm4yrwthmko>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Nov 2023 16:04:30 -0500
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> On Wed, Nov 08, 2023 at 03:56:06PM -0500, Steven Rostedt wrote:
> > I received the full message each time.  
> 
> I think Joe managed to hit a bug in mlmmj-1.4.0rc2 -- I had it enabled on
> ksummit. That was actually the other reason I'd started this conversation, as
> a way to test it on a large-ish list. ;)

Doing testing the Linux kernel way (send it out to the users and see what breaks!)

-- Steve

