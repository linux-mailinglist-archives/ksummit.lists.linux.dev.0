Return-Path: <ksummit+bounces-186-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8C83A345A
	for <lists@lfdr.de>; Thu, 10 Jun 2021 21:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 2EF721C0E5A
	for <lists@lfdr.de>; Thu, 10 Jun 2021 19:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCC72FB9;
	Thu, 10 Jun 2021 19:55:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B46170
	for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 19:55:25 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id b14so2975104ilq.7
        for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 12:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yThRUwhG7TVMYzDnZQ36xlr9oSGBGPDfSkCu6ZGlYLg=;
        b=bPBjb3iQyivF7+ujnusT5zb7CgKPA/MPb60wwSSgl0fWJCJFIRsspxS5FLO3i3Db7o
         QTBIFLfWtoa+OTwkJsl8Od0iL6SjdITaP1KUiA1ZLnO0nbgYzNu8qBP6bqF9wOw6coVS
         0TZuIt7YeN1EtKC3bKArUXZMWQq1C4xTGVKSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yThRUwhG7TVMYzDnZQ36xlr9oSGBGPDfSkCu6ZGlYLg=;
        b=X0ey6CLrVPThnzNsiSh/ESUxey62DBvSJDZNCgt/HhZbTaqlxK8kO5ldpVoGfArgE4
         dtMqMqQ3pJirLiQnjQ1tOuiZ68Lfhwp18KXMrI1c+iVLw7erQvLh2BWXlEPXsvomY5MI
         PFj5DVHmzzs0RUrClg36RmZxD9WFB+5f2OIUt9mh3W3D/FpAL5eTuYVekSNwKL5h6J/f
         lwZoU4UVJ3yi3pSOI1ZubZdLkcrynwz3OhrBYR2E50QsOUmXfa0jrL43ItLzTpav6s68
         0FPwHBfZGUGIsDC3jkF51s1Ax0nI8QiTnjPJ8osT6WM8wba7arpKD8wHSbHP5QF+4U0e
         PwJg==
X-Gm-Message-State: AOAM533qZLjl3zKGDCs73lqHmZSxB4ldrkLzZ5Cr8ql47mj/rz1XHd3z
	mXog4Piu+1BovoxByrq2/hvmlg==
X-Google-Smtp-Source: ABdhPJxrEvwWy3XAmz/7jj02iTalwtXM7UAmJCMJjFJ1UH5U58C7wt3JsSnlbOrDwD06v36kFE802g==
X-Received: by 2002:a05:6e02:4b0:: with SMTP id e16mr335801ils.71.1623354925138;
        Thu, 10 Jun 2021 12:55:25 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id u18sm2447941ilb.51.2021.06.10.12.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 12:55:24 -0700 (PDT)
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
To: Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 David Hildenbrand <david@redhat.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>,
 Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
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
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
Date: Thu, 10 Jun 2021 13:55:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210610152633.7e4a7304@oasis.local.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/10/21 1:26 PM, Steven Rostedt wrote:
> On Thu, 10 Jun 2021 21:39:49 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> 
>> There will always be more informal discussions between on-site
>> participants. After all, this is one of the benefits of conferences, by
>> being all together we can easily organize ad-hoc discussions. This is
>> traditionally done by finding a not too noisy corner in the conference
>> center, would it be useful to have more break-out rooms with A/V
>> equipment than usual ?
> 
> I've been giving this quite some thought too, and I've come to the
> understanding (and sure I can be wrong, but I don't think that I am),
> is that when doing a hybrid event, the remote people will always be
> "second class citizens" with respect to the communication that is going
> on. Saying that we can make it the same is not going to happen unless
> you start restricting what people can do that are present, and that
> will just destroy the conference IMO.
> 
> That said, I think we should add more to make the communication better
> for those that are not present. Maybe an idea is to have break outs
> followed by the presentation and evening events that include remote
> attendees to discuss with those that are there about what they might
> have missed. Have incentives at these break outs (free stacks and
> beer?) to encourage the live attendees to attend and have a discussion
> with the remote attendees.
> 
> The presentations would have remote access, where remote attendees can
> at the very least write in some chat their questions or comments. If
> video and connectivity is good enough, perhaps have a screen where they
> can show up and talk, but that may have logistical limitations.
> 

You are absolutely right that the remote people will have a hard time
participating and keeping up with in-person participants. I have a
couple of ideas on how we might be able to improve remote experience
without restricting in-person experience.

- Have one or two moderators per session to watch chat and Q&A to enable
   remote participants to chime in and participate.
- Moderators can make sure remote participation doesn't go unnoticed and
   enable taking turns for remote vs. people participating in person.

It will be change in the way we interact in all in-person sessions for
sure, however it might enhance the experience for remote attendees.

thanks,
-- Shuah

