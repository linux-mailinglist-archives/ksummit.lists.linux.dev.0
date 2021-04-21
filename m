Return-Path: <ksummit+bounces-20-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E6F367471
	for <lists@lfdr.de>; Wed, 21 Apr 2021 22:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id BB92E3E2635
	for <lists@lfdr.de>; Wed, 21 Apr 2021 20:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34A02FA2;
	Wed, 21 Apr 2021 20:50:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC552F81
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 20:50:40 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AdHjS363DFT7/qYvKeF5GagqjBHokLtp033Aq?=
 =?us-ascii?q?2lEZdDV+dMuEm8ey2MkKzBOcskdzZFgMkc2NUZPwJE/02oVy5eAqU4uKeCnDlC?=
 =?us-ascii?q?+WIJp57Y3kqgeBJwTb+vRG3altN4hyYeeAb2RStsrx7AmmH9tI+rDum8qVrNzT?=
 =?us-ascii?q?1nJ8CTxtApsA0y5CFg2ZHkdqLTMrObMFEvOni/Zvln6FcXQTYt/TPBY4Y9Q=3D?=
X-IronPort-AV: E=Sophos;i="5.82,240,1613430000"; 
   d="scan'208";a="504390214"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 22:50:39 +0200
Date: Wed, 21 Apr 2021 22:50:39 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Steven Rostedt <rostedt@goodmis.org>
cc: Stephen Hemminger <stephen@networkplumber.org>, 
    Roland Dreier <roland@kernel.org>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial"
 patches
In-Reply-To: <20210421164519.4aa271b9@gandalf.local.home>
Message-ID: <alpine.DEB.2.22.394.2104212249590.20674@hadrien>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <20210421152209.68075314@gandalf.local.home> <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com> <alpine.DEB.2.22.394.2104212150230.20674@hadrien>
 <20210421132824.13a70f6c@hermes.local> <alpine.DEB.2.22.394.2104212233450.20674@hadrien> <20210421164519.4aa271b9@gandalf.local.home>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 21 Apr 2021, Steven Rostedt wrote:

> On Wed, 21 Apr 2021 22:37:55 +0200 (CEST)
> Julia Lawall <julia.lawall@inria.fr> wrote:
>
> > The apology states that they didn't detect any vulnerabilities.  They
> > found three non exploitable bugs and submitted incorrect patches for them.
> > When the patches received some positive feedback, they explained that the
> > patches were incorrect and provided a proper fix.
> >
> > So they damaged trust, but not actually the Linux kernel...
>
> That's what they stated, but did any patch that they knew was incorrect
> actually make it into the kernel? If so, then it's on them.

No idea.  The apology goes to great lengths to say that none did, but who
knows.

julia

