Return-Path: <ksummit+bounces-124-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C0436888C
	for <lists@lfdr.de>; Thu, 22 Apr 2021 23:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 682211C6D7A
	for <lists@lfdr.de>; Thu, 22 Apr 2021 21:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC7F2FA6;
	Thu, 22 Apr 2021 21:26:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68642FA2
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 21:26:42 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1619126801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rR0AUie51HNmwLrfJFQK9J/ecpaUMYyb/PT9ywI8dpQ=;
	b=EGNcP93+FwvdyoSvFc4jwK+ts6NjWGDgNOVooL8JkzwlUt5MDpzc6juVysPFqNyD+m2fp5
	xr7cav4CDmbn3hmwf/rluJTA6T7A63zTec5zQOLNsIoS+b7V0XoOVzbDRnRgC4B4oHzLyq
	aFvod+i0020S0eeyEwnP3loFJf7HiRKiEIDVESPpN6TXDvyzPEVdJqKsT24by5TsNckEHd
	2RI4wPNRXXtBR0DYEyCg5hWcqrd8Jmhbrs1CLNhf5H3hTZ/JuD7yXlENu1XjklX51wZoow
	qFl08A37axx4ymgX7niviyvSYDLwK63y4235wXhox1i3jJLZqsSxYH2vPrwdNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1619126801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rR0AUie51HNmwLrfJFQK9J/ecpaUMYyb/PT9ywI8dpQ=;
	b=7bgZiS2VjlxhFIBnm45R544izXF72KhJEF0IczUFRzPW41/garviwskYILg1NHm5RuPTA+
	ObYQDlkt8GhCUuAw==
To: Jiri Kosina <jkosina@suse.cz>, Bart Van Assche <bvanassche@acm.org>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, Shuah Khan <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial" patches
In-Reply-To: <nycvar.YFH.7.76.2104221959370.18270@cbobk.fhfr.pm>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <20210422123559.1dc647fb@coco.lan> <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org> <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com> <f3c4cb63-f0f7-97be-227a-7a1a0db34650@acm.org> <nycvar.YFH.7.76.2104221959370.18270@cbobk.fhfr.pm>
Date: Thu, 22 Apr 2021 23:26:40 +0200
Message-ID: <8735vixb73.ffs@nanos.tec.linutronix.de>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 22 2021 at 20:03, Jiri Kosina wrote:
> On Thu, 22 Apr 2021, Bart Van Assche wrote:
>
>> Why was the trivial tree introduced? I may be missing some history here.
>
> The idea (some time in the stone age, way before I took it over), IIRC, 
> was that trivial patches are eating up cycles of maintainers that could be 
> spent in better way.
>
> This reasoning is completely moot now of course, as I myself don't have 
> time for taking care of that tree any more for quite some time already.
>
> Earth would definitely not stop rotating if we nuke any mentions of 
> trivial@ from the Documentation/ altogether.
>
>> I'm not convinced that sending trivial patches to a separate mailing 
>> list and maintainer helps everyone. As an example, I want to see block 
>> layer patches being posted on the block layer mailing list and I want to 
>> see SCSI patches being posted on the SCSI mailing list. I don't want to 
>> have to follow a separate "trivial" mailing list to verify whether or 
>> not e.g. a patch is posted on that mailing list that changes a correct 
>> comment into an incorrect comment.
>
> Most of the patches have usually been of a 'fix typo in english wording in 
> a comment / printk()' nature.

But even that typo muck creates conflicts which are not necessary at
all. So yes, that trivial thing should just die.

It seemed to be a good idea long ago ...

Thanks,

        tglx

