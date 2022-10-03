Return-Path: <ksummit+bounces-908-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB07F5F3310
	for <lists@lfdr.de>; Mon,  3 Oct 2022 18:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20979280A99
	for <lists@lfdr.de>; Mon,  3 Oct 2022 16:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E7917E9;
	Mon,  3 Oct 2022 16:03:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2417C;
	Mon,  3 Oct 2022 16:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2CDC433D6;
	Mon,  3 Oct 2022 16:03:52 +0000 (UTC)
Date: Mon, 3 Oct 2022 12:03:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Slade Watkins
 <srw@sladewatkins.net>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, "Artem S. Tashkinov" <aros@gmx.com>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221003120352.06de4a83@gandalf.local.home>
In-Reply-To: <YzsG2uC70WfawKTs@pendragon.ideasonboard.com>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
	<05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
	<63a8403d-b937-f870-3a9e-f92232d5306c@leemhuis.info>
	<534EB870-3AAE-4986-95F3-0E9AD9FCE45B@sladewatkins.net>
	<e9dd6af0-37ef-1195-0d3b-95601d1ab902@leemhuis.info>
	<20221003112605.4d5ec4e9@gandalf.local.home>
	<YzsDbeF8WQHy9Hat@pendragon.ideasonboard.com>
	<20221003115102.35bff30e@gandalf.local.home>
	<YzsG2uC70WfawKTs@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Oct 2022 18:59:22 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> > Sometimes, even if it prevents a laptop from working properly, it could be
> > ignored if a workaround is in place. Like just buying an external webcam if
> > you can't get the internal one working.  
> 
> That's an interesting example. https://lwn.net/Articles/904776/ shows
> how it made lots of users *very* unhappy.

I figured you would appreciate that example ;-)

-- Steve

