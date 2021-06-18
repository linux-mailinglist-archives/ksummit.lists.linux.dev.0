Return-Path: <ksummit+bounces-211-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D173ACE69
	for <lists@lfdr.de>; Fri, 18 Jun 2021 17:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 8D9633E10D9
	for <lists@lfdr.de>; Fri, 18 Jun 2021 15:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6F62FB0;
	Fri, 18 Jun 2021 15:16:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE85072
	for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RgVJs2i8tjM9Pp4R41S3t73s45Mwafddh6w7ln+ElM8=; b=R2PFR6jNbhLZQlpmxq/JWMwAr/
	6/+buuKy5tLGwbjl1+xqZ6b5Z6ZvR8fhu2Z7ZdJqlU7AvMh+P1AXqVDr46MFZvjqPoc7o0lqL5IHK
	gL69zR2N10yHqOnnBMUfcdqqoIID5L3vUHJBBTZ72+cTTRAl2PV6a+F2jCnS7JxPydBkhq4S5dNwe
	Cfb6I/g6AncVgs1hDvitkH7bI06nS8CuNX592/uIlTlkm+J6ZTBzY3AL3ImuabxIfasxZoeaU6yNU
	yFcMrQ/7GT6xdlU35a/Lk9UM6Hq7hjJ8e+RL5PMHITV2nXJuN/4Zwo3Q0ceWQy2EsH8jMKE2pzKun
	Dbt0dPBA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luGCQ-00AOje-B9; Fri, 18 Jun 2021 15:14:38 +0000
Date: Fri, 18 Jun 2021 16:14:26 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"Enrico Weigelt, metux IT consult" <lkml@metux.net>,
	David Hildenbrand <david@redhat.com>, Greg KH <greg@kroah.com>,
	Christoph Lameter <cl@gentwo.de>, Theodore Ts'o <tytso@mit.edu>,
	Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-block@vger.kernel.org,
	Linux FS Devel <linux-fsdevel@vger.kernel.org>,
	Linux MM <linux-mm@kvack.org>, netdev <netdev@vger.kernel.org>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	Linux API <linux-api@vger.kernel.org>
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <YMy4UjWH565ElFtZ@casper.infradead.org>
References: <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
 <20210610182318.jrxe3avfhkqq7xqn@nitro.local>
 <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
 <20210610152633.7e4a7304@oasis.local.home>
 <37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
 <YMyjryXiAfKgS6BY@pendragon.ideasonboard.com>
 <cd7ffbe516255c30faab7a3ee3ee48f32e9aa797.camel@HansenPartnership.com>
 <CAMuHMdVcNfDvpPXHSkdL3VuLXCX5m=M_AQF-P8ZajSdXt8NdQg@mail.gmail.com>
 <20210618103214.0df292ec@oasis.local.home>
 <CAMuHMdWK4NPzanF68TMVuihLFdRzxhs0EkbZdaA=BUkZo-k6QQ@mail.gmail.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWK4NPzanF68TMVuihLFdRzxhs0EkbZdaA=BUkZo-k6QQ@mail.gmail.com>

On Fri, Jun 18, 2021 at 04:58:08PM +0200, Geert Uytterhoeven wrote:
> Hi Steven,
> 
> On Fri, Jun 18, 2021 at 4:32 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > On Fri, 18 Jun 2021 16:28:02 +0200
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > > What about letting people use the personal mic they're already
> > > carrying, i.e. a phone?
> >
> > Interesting idea.
> >
> > I wonder how well that would work in practice. Are all phones good
> > enough to prevent echo?
> 
> I deliberately didn't say anything about a speaker ;-)

There's usually a speaker in the room so everyone can hear the question
...

