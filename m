Return-Path: <ksummit+bounces-489-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5CA3FBCEF
	for <lists@lfdr.de>; Mon, 30 Aug 2021 21:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 872AB3E1044
	for <lists@lfdr.de>; Mon, 30 Aug 2021 19:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FCE3FD0;
	Mon, 30 Aug 2021 19:33:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622403FC3
	for <ksummit@lists.linux.dev>; Mon, 30 Aug 2021 19:33:37 +0000 (UTC)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 17UJXT4m020247
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Aug 2021 15:33:30 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 8CFB515C3E7E; Mon, 30 Aug 2021 15:33:29 -0400 (EDT)
Date: Mon, 30 Aug 2021 15:33:29 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: dave.bueso@gmail.com, daniel.m.jordan@oracle.com,
        pasha.tatashin@soleen.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev,
        Jesse Barnes <jsbarnes@google.com>, Alex Levin <levinale@google.com>
Subject: Re: kSummit proposal - The Linux kernel in ChromeOS
Message-ID: <YS0yiVVa01xbVu7t@mit.edu>
References: <CAEeCyJZas4LCnMWYTo9Wh49N9DoBChzG869x41BpUoZ+1JmCGQ@mail.gmail.com>
 <CACRpkdYaRALXisvqhF8VyK-m0fz9aUFrurH2u5m=9DS4L3FHXg@mail.gmail.com>
 <YSgVPi9H4oBt5uy8@pendragon.ideasonboard.com>
 <CAEeCyJY8bXNQHL-kSbxrGcVwQ45kTaR9pW4eOm=ZShEwE5hFiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEeCyJY8bXNQHL-kSbxrGcVwQ45kTaR9pW4eOm=ZShEwE5hFiQ@mail.gmail.com>

On Thu, Aug 26, 2021 at 06:01:04PM -0700, Alex Levin wrote:
> Thanks for the feedback Linus and Laurent.
> 
> We are willing to extend this to 90 minutes and cover the
> opportunities and challenges we have WRT to SoC manufacturers
> upstreaming and how ChromeOS is influencing upstreaming.
> 
> I wasn't sure we will be accepted as a ksummit so it seems that the
> track for now is a MC, but that might change.

I've added the Performance and Scalability MC runners to this thread.

After taking a closer look at the proposal submitted to the
Performance MC:

   https://linuxplumbersconf.org/event/11/abstracts/1042/

... I noted that (a) the proposal wasn't about scalability in the
traditional sense (e.g., how well does the kernel work on CPU's with
192 cores) but rather scalability of the development process, and (b)
the talk was only scheduled for 20 minutes.

So I talked to Alex off-line, and we agreed that best approach was
probably to transfer his session transferred to the kernel summit
track, where he would be able to get a 45 minute slot --- assuming, of
course, that the Performance MC runners would be OK with this change.

If people would like to talk more than what can fit in a 45 minute
slot, there will be BOF session slots on Friday that people can
request for more conversation.  There will also be "hack rooms" that
are available, which will not be live-streamed nor permanently
recorded.

Dave, Daniel, Pasha --- does this seem reasonable to you?

Thanks,

						- Ted

