Return-Path: <ksummit+bounces-139-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B1E368DD7
	for <lists@lfdr.de>; Fri, 23 Apr 2021 09:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id C1B9A1C633B
	for <lists@lfdr.de>; Fri, 23 Apr 2021 07:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510112FA4;
	Fri, 23 Apr 2021 07:20:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B4F70
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 07:19:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 225EB127D;
	Fri, 23 Apr 2021 03:19:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 23 Apr 2021 03:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=8gLzmBC+Z56cg6lmfpNVdUIZE2d
	pYZIGFirlHIfVmes=; b=CoyBdoEoevLOc4s33RO2A4TbJJ0NOAzUqZ5hm3qviyJ
	fBQj2XeRJL+4jpqplq/V5Vj2tuHokSuUSqJbduzNQAdnvWqro/nzbJGmhxiRUzhQ
	j/37fZVlewHfJG1j9QQH7wtSOInme1cnHlellMO7OwAOJVeCo6xchwYxBS3hOoJL
	ImZBS8uzAaJ838uYILl69dFfNwyJkpfKMCOqZa4H+XjmElGJ+9Ka7barSpSOiZ1d
	LkvSFAM9fcOXo1RqjfYY0Dx4YfDfUfoyBK1xOY32qSe/1gsvxw6ht6chENZwWhwR
	P/8fD+ga8AN6YiDjY605SLv0oyufQZI0LCEkI4fH82w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8gLzmB
	C+Z56cg6lmfpNVdUIZE2dpYZIGFirlHIfVmes=; b=PFa5vvT1JdR2fgP0gEeUyV
	FCtEcPGo5wILiTRsHnmSnd1tFnKSZAr97w+wBTrkP+o/0TLy231vUDHE0OVBbVOM
	wh60yNmAyJwIW2shgAd+H7py4zi2VqzPIPq47hqo3s2szskijBakgMPzplo5BrPh
	xCOomMW5lHmcavdPVmeNp4TmgsEmhz7h998lg9d6XIbBzCqdsIfofD9xzk/Ha5sZ
	Qgklg/pQ8pv6Gf1l3Fy4nfpix+QRHPOyiUFGGi0xPtC9rV2dov3FzG4BPEaMLqNO
	hjSJuHv7G7ybGDxAl/PURNLvGwuWLnqa3ATcnGxfMElIMC26QTRZij54hfGa4/pw
	==
X-ME-Sender: <xms:HHWCYCIH8rvDOEb8f0xyyiZrr9e8Wi6AXJUn6GefnzlyYUUmxaARYw>
    <xme:HHWCYKKxw88tZG5mR48dTMc-06gPo4P7GyaCq6FPScYfLAc7oq1A6h5cDYQ3pMlJw
    3eDE6MjLM-coQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduuddgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:HXWCYCuGonyNorn1kAh_djcU16GS8aA4gZfZAwn0oXoTk2CZAP_9-A>
    <xmx:HXWCYHYuRVRNoQCpRfEzQK4xOeGzJGsSsxVWYPB7d9fHZvpoEE4JsQ>
    <xmx:HXWCYJaQPm5q5HKEe42H-hWCvcmlMHrBq5QCmB85QwhoIP-wg7OYbw>
    <xmx:HXWCYInaVt5k6yGksmC2g5aAmvsOGiuVVM37_AOHJXInUQO9tBawJQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	by mail.messagingengine.com (Postfix) with ESMTPA id 891FF240057;
	Fri, 23 Apr 2021 03:19:56 -0400 (EDT)
Date: Fri, 23 Apr 2021 09:19:54 +0200
From: Greg KH <greg@kroah.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIJ1GqH0s437hXtv@kroah.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <20210422125357.uuxprp6rqxewcdsr@nitro.local>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422125357.uuxprp6rqxewcdsr@nitro.local>

On Thu, Apr 22, 2021 at 08:53:57AM -0400, Konstantin Ryabitsev wrote:
> On Thu, Apr 22, 2021 at 11:20:01AM +0200, Mauro Carvalho Chehab wrote:
> > Also, nowadays, with lore and b4, it would be easy to retrieve the
> > entire patch series, even for those that aren't subscribed on a 
> > c/c mailing list.
> 
> If you're a mutt user, you can set up a keybinding, e.g.:
> 
>     macro index 4 "<pipe-message>~/work/git/korg/b4/b4.sh mbox -f -o ~/Mail<return>"

What???

I didn't know about "-f", that is wonderful!!!

/me goes off to add yet-another-mutt-macro

greg k-h

