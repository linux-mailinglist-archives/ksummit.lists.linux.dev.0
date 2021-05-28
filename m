Return-Path: <ksummit+bounces-174-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 809C7394551
	for <lists@lfdr.de>; Fri, 28 May 2021 17:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 6B1043E0F06
	for <lists@lfdr.de>; Fri, 28 May 2021 15:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6476D11;
	Fri, 28 May 2021 15:42:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1E42FB4
	for <ksummit@lists.linux.dev>; Fri, 28 May 2021 15:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622216572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sC/4mqGVwjGmarPwyWnSGWMjis6RsnduR1OTuOfsgPQ=;
	b=fNck41KMsnfRon9k5u2SYW5M+8HovxeN6A94+qedbZ2JoVyaxV0u209EdJ3Iex41R37ru2
	NoyiTCQWW3eNXs+UHfQB1TR/fQ03WKVOxqES4gXJVRxdG+FSysPpvlOaYM7LS+kurX229E
	YOwu7wVhk9IORWSm8YcbkNXFGeXyKD8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-V8XzVUFwM7CLqjjKYWZGww-1; Fri, 28 May 2021 11:42:50 -0400
X-MC-Unique: V8XzVUFwM7CLqjjKYWZGww-1
Received: by mail-ej1-f70.google.com with SMTP id h18-20020a1709063992b02903d59b32b039so1280301eje.12
        for <ksummit@lists.linux.dev>; Fri, 28 May 2021 08:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=sC/4mqGVwjGmarPwyWnSGWMjis6RsnduR1OTuOfsgPQ=;
        b=OeOMXmqM+7RXvtIrm9bDb/xtaeX962NMLdyGWIIx3kiEBJY/tpD9PmDzLcOrOZit1D
         oB4q8Byga1gngkpmDIIqK3nc/6YymsBdImOshgFVLpOz+pvajT/VPjG3cl7zOTLHy28T
         CH3qstSYdxOaOYTLFNy3HJzEqol5zkJKsaojJcVVOmSrilBXyCJNotGCqSDb6Hlftxnu
         1uGSOkdmLxVXtqJP+LSHuWhXjJs7JNB2pHywO4dnlcPoURzhB/VFgjVxbQUQjxpEGO9Y
         tO3fZ7sVc1YKxRA7EKZbJKcFrfy/QOw5P/eDyA1RhHsPx0+/AvjWsQReKbjwY0tgQJkU
         NsRQ==
X-Gm-Message-State: AOAM532iSYPga2/6uZom/k85jHbliD44m/KUzbIz13N7CLbSvgqZbhpz
	5dJDcYJUxH0man5egojcyLnw3pxs/ukULZvAjZPa3MwFLhBRI2wss6lh3p/H8rkQaHbw74m89/k
	nz3InYhKdlV2+EuhstA==
X-Received: by 2002:a50:d589:: with SMTP id v9mr10813394edi.126.1622216569044;
        Fri, 28 May 2021 08:42:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyh7puphKWIHAhTU3NrGDcpIPKc1l/cTOKXvbBu9zHj9YOh1870e+pFMIR14K/Zqb2VV4uAA==
X-Received: by 2002:a50:d589:: with SMTP id v9mr10813361edi.126.1622216568644;
        Fri, 28 May 2021 08:42:48 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id v24sm2839644eds.19.2021.05.28.08.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 08:42:48 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 86A4A180720; Fri, 28 May 2021 17:42:47 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Matthew Wilcox <willy@infradead.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>, Theodore
 Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
In-Reply-To: <YLEIKk7IuWu6W4Sy@casper.infradead.org>
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <YLEIKk7IuWu6W4Sy@casper.infradead.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 28 May 2021 17:42:47 +0200
Message-ID: <87im32g8zs.fsf@toke.dk>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=toke@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Matthew Wilcox <willy@infradead.org> writes:

> On Fri, May 28, 2021 at 07:58:10AM -0700, James Bottomley wrote:
>> On Thu, 2021-05-27 at 15:29 +0200, Greg KH wrote:
>> > On Thu, May 27, 2021 at 03:23:03PM +0200, Christoph Lameter wrote:
>> > > On Fri, 30 Apr 2021, Theodore Ts'o wrote:
>> > > 
>> > > > I know we're all really hungry for some in-person meetups and
>> > > > discussions, but at least for LPC, Kernel Summit, and
>> > > > Maintainer's Summit, we're going to have to wait for another
>> > > > year,
>> > > 
>> > > Well now that we are vaccinated: Can we still change it?
>> > > 
>> > 
>> > Speak for yourself, remember that Europe and other parts of the world
>> > are not as "flush" with vaccines as the US currently is :(
>> 
>> The rollout is accelerating in Europe.  At least in Germany, I know
>> people younger than me are already vaccinated.  I think by the end of
>> September the situation will be better ... especially if the EU and US
>> agree on this air bridge (and the US actually agrees to let EU people
>> in).
>> 
>> One of the things Plumbers is thinking of is having a meetup at what
>> was OSS EU but which is now in Seattle.  The Maintainer's summit could
>> do the same thing.  We couldn't actually hold Plumbers in Seattle
>> because the hotels still had masks and distancing requirements for
>> events that effectively precluded the collaborative aspects of
>> microconferences, but evening events will be governed by local
>> protocols, rather than the Hotel, which are already more relaxed.
>
> Umm.  Let's remember that the vaccines are 33-93% effective [1],
> which means that there's approximately a 100% certainty that at least
> one person arriving at the event from a trans-atlantic flight has been
> exposed to someone who has the virus.  I'm not convinced that holding a
> "more relaxed protocol" event is a great idea.

Not to mention the fact that this would exclude everyone from parts of
the world that do not have a high vaccine coverage or a cosy "air
bridge" type relationship with the US (whatever that means); aren't we
supposed to be an international community? :/

-Toke


