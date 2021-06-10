Return-Path: <ksummit+bounces-191-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E7A3A3751
	for <lists@lfdr.de>; Fri, 11 Jun 2021 00:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 848E93E0FB0
	for <lists@lfdr.de>; Thu, 10 Jun 2021 22:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08B62FBF;
	Thu, 10 Jun 2021 22:43:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E22173
	for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 22:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623364991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V5yzb21nbg0WXga74jQ6xsvVDaavF5Xwuj6ArQYTfOY=;
	b=CEGlrG/C3oFjNzrgM0S7Espelc2hPmCHwKv4b8MZDQkCMsE5+hL/mX7b/sSTF+tsW67R8A
	w42MAfdxRktkkRr7TFOAbXTLIizsSHcLGpiEkpsg9kqMv4M9ndnkiUP5brLLplcZI0ckim
	cCY+guadu+5ElyxEBNk5kAuMpyGkhqI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-ab4G6L9jOLSLs0KnQiyKoA-1; Thu, 10 Jun 2021 18:43:08 -0400
X-MC-Unique: ab4G6L9jOLSLs0KnQiyKoA-1
Received: by mail-ed1-f72.google.com with SMTP id z5-20020a05640235c5b0290393974bcf7eso6452111edc.2
        for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 15:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=V5yzb21nbg0WXga74jQ6xsvVDaavF5Xwuj6ArQYTfOY=;
        b=Cm35kd7rHfCZ1j6eu9wJNLt4dwqIEUuGwT5IjU/3k6vEhX+POJ/vHcm6utjOOI+enJ
         2cMcn30dnmqa0W6yNO3rS/fV8OWoklowvIakKrzvTzfe4HDmWpbyi6/ad5rHjVKrcMOj
         ogOms/wjkojHhyumYsS1Vt9FliwJDNyDbKpiEO6jPncCArDEAXrrwrsCz/I8DweebbaX
         g6iqHHOnme19KImJeB6svAf2TGQGvXgqO7xC6JG8bIy/siG8EPacE3rXGloz48fCk9t1
         vuS+vXHtI2FpOTHAgBstpxor0AkbkeiOUI0vaGQERPK3lfOcbaezuDH/lNuvm1n5V+Oa
         mmiw==
X-Gm-Message-State: AOAM532FHjxLj/SVHbiHLncr6oowTVsp5EBFSNAM7SIiP1oMPfu3Sd9L
	p7BLum4T8mNaMTF6WrzqFwaN+/HhShmv4Co38YXDcUCV00Gx8fs0s09+CQ72VfV/hrragW9ZrMH
	pjmqk8pj5qbf0NbiZFw==
X-Received: by 2002:a17:906:e44:: with SMTP id q4mr686723eji.120.1623364987091;
        Thu, 10 Jun 2021 15:43:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3Of813xtsFNMUywKOhdyaCRUGvejxpofMzlcEGjq5vOPDHQSpbSONXjsKSs4Nlp7UDRGRdQ==
X-Received: by 2002:a17:906:e44:: with SMTP id q4mr686706eji.120.1623364986880;
        Thu, 10 Jun 2021 15:43:06 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id ci12sm1489704ejc.17.2021.06.10.15.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 15:43:06 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 627F718071E; Fri, 11 Jun 2021 00:43:05 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Shuah Khan <skhan@linuxfoundation.org>, Steven Rostedt
 <rostedt@goodmis.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>, David Hildenbrand <david@redhat.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>, Greg KH
 <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>, Theodore Ts'o
 <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-api@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
In-Reply-To: <37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
 <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
 <20210610182318.jrxe3avfhkqq7xqn@nitro.local>
 <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
 <20210610152633.7e4a7304@oasis.local.home>
 <37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 11 Jun 2021 00:43:05 +0200
Message-ID: <87tum5uyrq.fsf@toke.dk>
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

Shuah Khan <skhan@linuxfoundation.org> writes:

> On 6/10/21 1:26 PM, Steven Rostedt wrote:
>> On Thu, 10 Jun 2021 21:39:49 +0300
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>> 
>>> There will always be more informal discussions between on-site
>>> participants. After all, this is one of the benefits of conferences, by
>>> being all together we can easily organize ad-hoc discussions. This is
>>> traditionally done by finding a not too noisy corner in the conference
>>> center, would it be useful to have more break-out rooms with A/V
>>> equipment than usual ?
>> 
>> I've been giving this quite some thought too, and I've come to the
>> understanding (and sure I can be wrong, but I don't think that I am),
>> is that when doing a hybrid event, the remote people will always be
>> "second class citizens" with respect to the communication that is going
>> on. Saying that we can make it the same is not going to happen unless
>> you start restricting what people can do that are present, and that
>> will just destroy the conference IMO.
>> 
>> That said, I think we should add more to make the communication better
>> for those that are not present. Maybe an idea is to have break outs
>> followed by the presentation and evening events that include remote
>> attendees to discuss with those that are there about what they might
>> have missed. Have incentives at these break outs (free stacks and
>> beer?) to encourage the live attendees to attend and have a discussion
>> with the remote attendees.
>> 
>> The presentations would have remote access, where remote attendees can
>> at the very least write in some chat their questions or comments. If
>> video and connectivity is good enough, perhaps have a screen where they
>> can show up and talk, but that may have logistical limitations.
>> 
>
> You are absolutely right that the remote people will have a hard time
> participating and keeping up with in-person participants. I have a
> couple of ideas on how we might be able to improve remote experience
> without restricting in-person experience.
>
> - Have one or two moderators per session to watch chat and Q&A to enable
>    remote participants to chime in and participate.
> - Moderators can make sure remote participation doesn't go unnoticed and
>    enable taking turns for remote vs. people participating in person.
>
> It will be change in the way we interact in all in-person sessions for
> sure, however it might enhance the experience for remote attendees.

This is basically how IETF meetings function: At the beginning of every
session, a volunteer "jabber scribe" is selected to watch the chat and
relay any questions to a microphone in the room. And the video streaming
platform has a "virtual queue" that remove participants can enter and
the session chairs are then responsible for giving people a chance to
speak. Works reasonably well, I'd say :)

-Toke


