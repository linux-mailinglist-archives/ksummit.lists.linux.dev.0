Return-Path: <ksummit+bounces-166-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE8137033D
	for <lists@lfdr.de>; Fri, 30 Apr 2021 23:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 9D3441C0D60
	for <lists@lfdr.de>; Fri, 30 Apr 2021 21:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48DA2F9D;
	Fri, 30 Apr 2021 21:51:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305AC2F80
	for <ksummit@lists.linux.dev>; Fri, 30 Apr 2021 21:51:26 +0000 (UTC)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 13ULmu1e024684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Apr 2021 17:48:56 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id E6B1F15C39C4; Fri, 30 Apr 2021 17:48:55 -0400 (EDT)
Date: Fri, 30 Apr 2021 17:48:55 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jiri Kosina <jikos@kernel.org>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, netdev@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <YIx7R6tmcRRCl/az@mit.edu>
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>

On Wed, Apr 28, 2021 at 12:29:52PM +0200, Jiri Kosina wrote:
> On Mon, 19 Apr 2021, Theodore Ts'o wrote:
> 
> > This year, the Maintainers and Kernel Summit is currently planned to
> > be held in Dublin, Ireland, September 27 -- 29th.  
> 
> Given the fact that OSS is being relocated from Dublin to Washington [1], 
> is Kernel Summit following that direction?
> 
> [1] https://www.linuxfoundation.org/en/press-release/the-linux-foundation-announces-open-source-summit-embedded-linux-conference-2021-will-move-from-dublin-ireland-to-seattle-washington/

Apologies for the delay in responding; I wasiting for the LPC to post
its announcement that the LPC will be going 100% virtual:

   https://www.linuxplumbersconf.org/blog/2021/index.php/2021/04/30/linux-plumbers-goes-fully-virtual/

As the LPC planning committee stated,

   "Unfortunately, the safety protocols imposed by event venues in the
   US require masks and social distancing which make it impossible to
   hold the interactive part of Plumbers (the Microconferences)."

The Maintainer's Summit is even more interactive and discussion
focused than most of the Microconferences.  In addition, for the last
few years, the Kernel Summit is run as a track at the LPC.  As a
result, both the Maintainer's and Kernel Summit will be held virtually
this year, using the LPC infrastructure, and will not be colocated
with OSS to Seattle.  We'll make sure the dates (plus some buffer for
travel) won't overlap to avoid creating conflicts for those who are
planning to attend OSS in Seattle.

I know we're all really hungry for some in-person meetups and
discussions, but at least for LPC, Kernel Summit, and Maintainer's
Summit, we're going to have to wait for another year,

Cheers,

					- Ted

