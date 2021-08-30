Return-Path: <ksummit+bounces-487-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A23FB8F1
	for <lists@lfdr.de>; Mon, 30 Aug 2021 17:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id C6D183E106F
	for <lists@lfdr.de>; Mon, 30 Aug 2021 15:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230563FCD;
	Mon, 30 Aug 2021 15:23:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E752F3FC2
	for <ksummit@lists.linux.dev>; Mon, 30 Aug 2021 15:23:34 +0000 (UTC)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 17UFJqve006314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Aug 2021 11:19:52 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 0897715C3E7E; Mon, 30 Aug 2021 11:19:52 -0400 (EDT)
Date: Mon, 30 Aug 2021 11:19:51 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Alex Levin <levinale@google.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev,
        Jesse Barnes <jsbarnes@google.com>
Subject: Re: kSummit proposal - The Linux kernel in ChromeOS
Message-ID: <YSz3F8Lp3SigHAd4@mit.edu>
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

Kernel Summit sessions are only 45 minutes, but we do have plenty of
time for BOF's.

What MC track were you proposing this for?

					- Ted

