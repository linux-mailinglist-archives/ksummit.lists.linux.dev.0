Return-Path: <ksummit+bounces-618-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6071841199B
	for <lists@lfdr.de>; Mon, 20 Sep 2021 18:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 8C39C1C0BED
	for <lists@lfdr.de>; Mon, 20 Sep 2021 16:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6743FCA;
	Mon, 20 Sep 2021 16:18:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB64A72
	for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 16:18:11 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id c7so39045764qka.2
        for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 09:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=95LUMqEJ9/lbpkDllt+74gP/DPDagYgPuusq48yd7js=;
        b=XyqFPnf9gMzF5YjPWm9T76f0zhiAkBwKe8qkdSUFTNfxCFqxS9Cq2QuVA7d5H6uz51
         MgyXYflsq1N/favy0shwrTE72MTUQ01ntdh89N/hDC5BzsadDUS7EmkgCoNxsLWk5/mj
         4A6iA+kg85+Zs0lSkbcqJ33+ASaMpayd0M8CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=95LUMqEJ9/lbpkDllt+74gP/DPDagYgPuusq48yd7js=;
        b=hq/h2dE0V+Q+49jEBbicAIJ+HnEgU8tb/R/U+zcoj5OPFHzMv42InuRoHIjpXLFva6
         9oh8HBC/N7nkUyhgCFTz1vdw6L842rcXakEEm6E5gPV6ZY4tq/xL3Oh5zCPtA9bWXkhM
         uzMjdl/eGlCO1XOlSoebfL9yW0T+pXkEXe7PWnhKvw8KdxJrNB1IIsoll1K40AbBWSZ1
         IM9x9R5xPHkg7tLH5ECE78UpSiqQKoyl4eOFBgwkowjIhclRvoChOM4D2sDMcXbjnpZk
         pf8xV+mmgBuCQPnwuJ2GsHFGdSmTsgRX/P5GVexYMQJ74al+4zeT6koqbk9EBBA9XwuW
         4GWg==
X-Gm-Message-State: AOAM5324kmJQpYCe1plALjcQS+TPXmhW/90sbOZhwtRWCxVBlCTQUQuM
	4v6Gg79lr9Nhx3wewg1inykDgw==
X-Google-Smtp-Source: ABdhPJzg8TRJjQ+Owc9YPRp8WpafdiFFFiGqLYQxAfkP6iSdFWJLPxITzthsdZg9VLuzVLb1nRtPSA==
X-Received: by 2002:a37:b483:: with SMTP id d125mr3679370qkf.362.1632154690680;
        Mon, 20 Sep 2021 09:18:10 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id r139sm10083414qke.84.2021.09.20.09.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 09:18:10 -0700 (PDT)
Message-ID: <bf22702e-01b2-214a-1650-da9e4ec3c2be@labbott.name>
Date: Mon, 20 Sep 2021 12:18:09 -0400
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [Tech-board-discuss] IMPORTANT: CIVS opt-in for Technical
 Advisory Board voting
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Dave Hansen <dave@sr71.net>
Cc: "tab-elections@lists.linuxfoundation.org"
 <tab-elections@lists.linuxfoundation.org>, ksummit@lists.linux.dev,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <44ee2bfe-e4bc-b918-b908-7352ea012524@oxidecomputer.com>
 <dfa20866-0d00-9bd3-6078-5544cfa5b633@sr71.net>
 <CAMuHMdUUfm6u_Pz3qzA0V7tLZd7jhcwdyxU7L0SyC_EdyzwQxw@mail.gmail.com>
 <CAMuHMdVtHDQ2f0VKAdQFQV9dZJ5uFGD9yHvNviQ_k7AEfhN77w@mail.gmail.com>
From: Laura Abbott <laura@labbott.name>
In-Reply-To: <CAMuHMdVtHDQ2f0VKAdQFQV9dZJ5uFGD9yHvNviQ_k7AEfhN77w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/21 12:03, Geert Uytterhoeven wrote:
> On Mon, Sep 20, 2021 at 5:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Mon, Sep 20, 2021 at 5:37 PM Dave Hansen <dave@sr71.net> wrote:
>>> My @linux.intel.com account is the most common one from the git logs.  I
>>> have only received one TAB-related email there:
>>>
>>>          Subject: Upcoming Technical Advisory Board election -- look for
>>>                   your ballot
>>>
>>> However, I never actually received a ballot at that email, presumably
>>> because of this CIVS opt-in issue.
>>>
>>> Was this just me?  Or would it be appropriate to send these opt-in
>>> instructions to all of those that should have received a ballot instead
>>> of just sending to the mailing lists?
>>
>> I did the CIVS opt-in, and entered the confirmation number.
>> Still, unlike Vlastimil, I saw no way to vote?
>> Just retried the opt-in, "already opted-in".
> 
> If you use multiple email addresses, make sure to opt-in using the exact
> same one on which you received the original email from Laura.
> Then there will be a link to the actual poll after entering the confirmation
> code.
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

Yes that is correct. We attempted to consolidate e-mail addresses if you
contribute under multiple ones. This is a pain point we will need to fix
next year.

Thanks,
Laura

