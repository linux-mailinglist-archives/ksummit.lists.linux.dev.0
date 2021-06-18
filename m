Return-Path: <ksummit+bounces-214-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EC53ACF39
	for <lists@lfdr.de>; Fri, 18 Jun 2021 17:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 133FC3E10E1
	for <lists@lfdr.de>; Fri, 18 Jun 2021 15:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE472FB0;
	Fri, 18 Jun 2021 15:34:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E92372
	for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 15:34:56 +0000 (UTC)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6B96961205;
	Fri, 18 Jun 2021 15:34:54 +0000 (UTC)
Date: Fri, 18 Jun 2021 11:34:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Matthew Wilcox <willy@infradead.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, "Enrico Weigelt, metux IT consult"
 <lkml@metux.net>, David Hildenbrand <david@redhat.com>, Greg KH
 <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>, "Theodore Ts'o"
 <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-block@vger.kernel.org, Linux FS Devel
 <linux-fsdevel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, netdev
 <netdev@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, Linux
 API <linux-api@vger.kernel.org>
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <20210618113452.7ab0033e@oasis.local.home>
In-Reply-To: <CAMuHMdWqUkfe7kdBO+eQdXHzhpygH=TivOBNqQJujyqP=wM5cw@mail.gmail.com>
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
	<YMy4UjWH565ElFtZ@casper.infradead.org>
	<CAMuHMdWqUkfe7kdBO+eQdXHzhpygH=TivOBNqQJujyqP=wM5cw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Jun 2021 17:29:04 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> W.r.t. the other speaker in the room, isn't that similar to the normal mic,
> and can't that be handled at the receiving side?
> There will be a bit more delay involved, though.

How many times have you been in a conference where the normal mic and
speaker caused a nasty feedback loop?

I'm not sure how well phone mics and room speakers will work.

-- Steve

