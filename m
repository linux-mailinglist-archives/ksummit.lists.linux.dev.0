Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD1B7E347F
	for <lists@lfdr.de>; Tue,  7 Nov 2023 05:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E2B31C209CC
	for <lists@lfdr.de>; Tue,  7 Nov 2023 04:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961BD944B;
	Tue,  7 Nov 2023 04:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B8E8F40;
	Tue,  7 Nov 2023 04:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 3A744Xf5023841;
	Tue, 7 Nov 2023 05:04:33 +0100
Date: Tue, 7 Nov 2023 05:04:33 +0100
From: Willy Tarreau <w@1wt.eu>
To: Christoph Hellwig <hch@infradead.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231107040433.GA23816@1wt.eu>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <87r0l2yi7v.fsf@email.froward.int.ebiederm.org>
 <ZUkcyCb5DEVEDkKj@infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUkcyCb5DEVEDkKj@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Nov 06, 2023 at 09:05:12AM -0800, Christoph Hellwig wrote:
> On Mon, Nov 06, 2023 at 10:11:48AM -0600, Eric W. Biederman wrote:
> > > - due to the sheer volume of messages, LKML is generally seen as useless for
> > >   holding any actual discussions
> > 
> > I have never had that impression of LKML.
> 
> Same here, I am actually reading through lkml, although superficially
> skipping over some bits, and definitively starting discussions there.

Same here. I used to have a procmail filter to deliver lkml to its own
box a decade ago and I figured that I lost contact with what was happening
so I removed that filter so that I move all these messages manually several
times a day after scrolling over them (a single key in mutt). This way
every day I can have a quick glance at all subjects there, that's how I
discover new topics, patch series, discussions etc. I think that a non
negligible number of LKML subscribers are there for this exact reason.

I would personally miss these messages if they would not be delivered
there anymore :-/ And I don't think that the situation would significantly
improve in the short term anyway due to this.

> Restricting access to the new lkml is not acceptable.  How about
> restricting access to all lists for gmail addresses if gmail is so
> broken?

Or even simpler, flush the queue very often and make it clear that gmail
is not a reliable recipiet for LKML. The trouble will self-regulate.

Just my two cents,
Willy

