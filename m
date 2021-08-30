Return-Path: <ksummit+bounces-490-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2293FBDA0
	for <lists@lfdr.de>; Mon, 30 Aug 2021 22:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 5919D1C0EDD
	for <lists@lfdr.de>; Mon, 30 Aug 2021 20:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9DB3FD0;
	Mon, 30 Aug 2021 20:49:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A64A3FC1
	for <ksummit@lists.linux.dev>; Mon, 30 Aug 2021 20:49:55 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id k24so11580331vsg.9
        for <ksummit@lists.linux.dev>; Mon, 30 Aug 2021 13:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z0lOOCS5dDdgZBg4qQOIwMKOJ1oujmtSmYz15Rf93BE=;
        b=aucZms6lS14WphvUjOP7Mgb93Fj6zeTu/h0XUkZNpEWBj2A5oZHW0sn3jP/H+YIyeD
         qjZDNB8Q+DDS+uJqJSr2Z7SXTN4lkFGmDtZS/0PftQjcjiKY7meGBg+EBwR5eer02LKa
         hUvNRtjhyj0+XCrzth2F89GQ1vCsCsDxAuBZgWGTsUESa20e40LagA/Lz8Ap78BU19pR
         hQO8wcI0l33/mHDRB1nN0v6rGzk0tpTxBKEOoic1eX69HmtNPQ+OItTdwF7tuDqaxwQx
         1drRGUFr/F7iorftHw1EitVVp6EI4lDN/23PNJL2sOF4qFLO004BCtYBTF6f+0SCOhVd
         kQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z0lOOCS5dDdgZBg4qQOIwMKOJ1oujmtSmYz15Rf93BE=;
        b=dAsuH8ZeD/uBBienJ+D0wZEz/GL9CoClCBMM8XDXbtx7xsTPPof6/oukxEiHF6C7rb
         AOoAlVo3GJZc90bipJOAOHAeF4VKXwSI32g8GxaApZCHvjvpLFBDsvvTH/zTFH3DpVV3
         n879nlGn/4hJ2ufsO3qp2p9ITRAq8KyH0NiAoN2MVvw0pk4ax87wXD0AFgtwPVdX3vMc
         yHvjg14QGQSKIRDOR+rlQAKckks4wz7NvuMCJPu2H7Y6ulFIaoPgQbq5oYl3UVX6t+UN
         yh/jE7lhOhSGB+89/AOPew0r8a17DtbxDTd3Zt+wsSU5HFPunsv2Mi2tAaLqcQu+XXdP
         h6Xw==
X-Gm-Message-State: AOAM532K5ESojrfw2MdMbUD8a1YNWsDOs3cstAKLLuBgfSWh8jl1rcLG
	nmsmWq/mP6ssC5WVrn2PM328LW4StTdNpo5J3ro8xIlb1t4=
X-Google-Smtp-Source: ABdhPJyyKiusmfnYpfOkDs2Ra4zYxTzSGfkNFZ+l3vdo40MA1/Cq9TDOzEq+2ItjUP4tzkQkQ+eYCZ8RI9JBSAtj3yQ=
X-Received: by 2002:a05:6102:1276:: with SMTP id q22mr9810457vsg.7.1630356594412;
 Mon, 30 Aug 2021 13:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEeCyJZas4LCnMWYTo9Wh49N9DoBChzG869x41BpUoZ+1JmCGQ@mail.gmail.com>
 <CACRpkdYaRALXisvqhF8VyK-m0fz9aUFrurH2u5m=9DS4L3FHXg@mail.gmail.com>
 <YSgVPi9H4oBt5uy8@pendragon.ideasonboard.com> <CAEeCyJY8bXNQHL-kSbxrGcVwQ45kTaR9pW4eOm=ZShEwE5hFiQ@mail.gmail.com>
 <YS0yiVVa01xbVu7t@mit.edu> <CAMJEoco4eHw6A04nBBtnCMOMW7HsE16uKMsNy02hRP1vt1C-AA@mail.gmail.com>
In-Reply-To: <CAMJEoco4eHw6A04nBBtnCMOMW7HsE16uKMsNy02hRP1vt1C-AA@mail.gmail.com>
From: Davidlohr Bueso <dave.bueso@gmail.com>
Date: Mon, 30 Aug 2021 13:49:43 -0700
Message-ID: <CAMJEocrBjR2gBCWnpB4rK=4URdjxodDDC50+yxop2MOmpKqO-g@mail.gmail.com>
Subject: Re: kSummit proposal - The Linux kernel in ChromeOS
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Daniel Jordan <daniel.m.jordan@oracle.com>, Pavel Tatashin <pasha.tatashin@soleen.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev, 
	Jesse Barnes <jsbarnes@google.com>, Alex Levin <levinale@google.com>
Content-Type: text/plain; charset="UTF-8"

(resending in plain text, sorry).

This is fine by me, and we had noted that this proposal was not about
performance in the conventional way, so being in ksummit track makes
sense.

Thanks,
Davidlohr


On Mon, Aug 30, 2021 at 1:44 PM Davidlohr Bueso <dave.bueso@gmail.com> wrote:
>
> This is fine by me, and we had noted that this proposal was not about performance in the conventional way, so being in ksummit track makes sense.
>
> Thanks,
> Davidlohr
>
> On Mon, Aug 30, 2021 at 12:33 PM Theodore Ts'o <tytso@mit.edu> wrote:
>>
>> On Thu, Aug 26, 2021 at 06:01:04PM -0700, Alex Levin wrote:
>> > Thanks for the feedback Linus and Laurent.
>> >
>> > We are willing to extend this to 90 minutes and cover the
>> > opportunities and challenges we have WRT to SoC manufacturers
>> > upstreaming and how ChromeOS is influencing upstreaming.
>> >
>> > I wasn't sure we will be accepted as a ksummit so it seems that the
>> > track for now is a MC, but that might change.
>>
>> I've added the Performance and Scalability MC runners to this thread.
>>
>> After taking a closer look at the proposal submitted to the
>> Performance MC:
>>
>>    https://linuxplumbersconf.org/event/11/abstracts/1042/
>>
>> ... I noted that (a) the proposal wasn't about scalability in the
>> traditional sense (e.g., how well does the kernel work on CPU's with
>> 192 cores) but rather scalability of the development process, and (b)
>> the talk was only scheduled for 20 minutes.
>>
>> So I talked to Alex off-line, and we agreed that best approach was
>> probably to transfer his session transferred to the kernel summit
>> track, where he would be able to get a 45 minute slot --- assuming, of
>> course, that the Performance MC runners would be OK with this change.
>>
>> If people would like to talk more than what can fit in a 45 minute
>> slot, there will be BOF session slots on Friday that people can
>> request for more conversation.  There will also be "hack rooms" that
>> are available, which will not be live-streamed nor permanently
>> recorded.
>>
>> Dave, Daniel, Pasha --- does this seem reasonable to you?
>>
>> Thanks,
>>
>>                                                 - Ted

