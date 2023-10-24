Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D87797D4FE8
	for <lists@lfdr.de>; Tue, 24 Oct 2023 14:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 160E71C20B4B
	for <lists@lfdr.de>; Tue, 24 Oct 2023 12:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDB415485;
	Tue, 24 Oct 2023 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7591B278;
	Tue, 24 Oct 2023 12:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E58EC433C8;
	Tue, 24 Oct 2023 12:36:48 +0000 (UTC)
Date: Tue, 24 Oct 2023 08:36:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, NeilBrown <neilb@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231024083647.6ca474aa@gandalf.local.home>
In-Reply-To: <20231024072506.GC31956@pendragon.ideasonboard.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
	<20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
	<169809755184.20306.3698252725424588550@noble.neil.brown.name>
	<CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
	<20231024072506.GC31956@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Oct 2023 10:25:06 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> I've refrained from replying to this thread so far, as it seemed to be a
> caricature of a bikeshedding discussion, but for what it's worth, I
> often find myself in the opposite situation when I'm annoyed that
> someone trimmed too much of the discussion in their replies.

After hitting "page down" 3 or 4 times and seeing only quoted text, I then
stop and just ignore the email. Yes, there's been emails I purposely
ignored because of this that had asked me to respond near the end. Oh well.
Then they ask, "why didn't you respond?" pointing out the email I was to
respond to. And I would reply, "I never saw the request because of too much
quoted text".

> 
> Yes, replying to a 3000-lines patches with a full quote ana d a
> Reviewed-by tag at the very bottom, without any other comment, is
> annoying. On the other hand, trimming everything but the few lines to
> which you reply means that it gets much more annoying to jump in the
> discussion in the middle of a mail thread. There's a difference between
> trimming unrelated parts, and removing related content that happens not
> to be the direct subject of a particular reply.

I just replied to an email yesterday that cut too much off, and I had to
make a note about that, and put things back in.

What's worse, is if you are having a technical debate with someone, and
they trim out everything that might go against their argument, but leave
anything that supports their argument. I've seen that happen quite a bit.

I should write a book called "The art of trimming". ;-)

-- Steve

