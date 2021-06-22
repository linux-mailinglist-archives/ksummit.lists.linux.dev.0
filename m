Return-Path: <ksummit+bounces-222-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1583B10A7
	for <lists@lfdr.de>; Wed, 23 Jun 2021 01:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 251FC3E0F6A
	for <lists@lfdr.de>; Tue, 22 Jun 2021 23:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E722FB6;
	Tue, 22 Jun 2021 23:33:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0D7173
	for <ksummit@lists.linux.dev>; Tue, 22 Jun 2021 23:33:51 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id a11so890542ilf.2
        for <ksummit@lists.linux.dev>; Tue, 22 Jun 2021 16:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FDnxriAkAs3WYRO9xpOUrYS828idlFB2knO2vwsUSvg=;
        b=QJp6/9lUz9fJ5U6y2HUgJa7Sj+zgXCAyP8rFy6A3tRUdsTNwtpE1lRwSa6HBQ7/PEW
         qq+20ws1w6cBSxmeNaX9dlTkAwg0rEsCoPQRrZK1PeH+YbxrtCe0pMym/UgkM/2iJhoi
         MZ+KedbRWDwjdkjJlhIPVWqN2VaoPXiZuOXM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FDnxriAkAs3WYRO9xpOUrYS828idlFB2knO2vwsUSvg=;
        b=WOZdkDpJhywqV6N4ZMp3Yi+ilfwMvohexTw18HB+Iw7l8K5kqfJDAP3Gld4GqIsEmL
         eEaIGxRXLgl8gL7LMSuVgNTFfc4YUT4UjW8+ALjFISc26qrxM8TK13gJrPvHV2qnx2d0
         JdX7PLP9uqBFZmLCNmt7FBFBXDuOjRDV6mfqF1DGdN/OzVWJMV1xECuYRQU+9ZWeQnRp
         M2AbwQL/oF4ty1MrAokrlUeSZoKc/sReDxcSy5H0fFRpGDpHfiCBLfdLjTijbQFYjFPe
         +NgALoroUf9BeSk/XbJM1ZYvW+8l187IyEX5Jj1cNFROEAuh78OGxbxxB9xd/ECYt8HA
         Ktgw==
X-Gm-Message-State: AOAM531gSNxf3kEo83M27gT1XibktC+4UbjvpyYfXnCN8/O6LxSotTHn
	7NjnRDdgOAJlZeoB2rajqTiFVA==
X-Google-Smtp-Source: ABdhPJw7keBbdI2oGPoqc6E/70YMOq7h5FAYPCK0uMP9DTLguDw3tyBjdv2Nb3LVTbHrhG9kIVx6Fw==
X-Received: by 2002:a92:a304:: with SMTP id a4mr798253ili.197.1624404830816;
        Tue, 22 Jun 2021 16:33:50 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id s8sm3047598ilj.51.2021.06.22.16.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 16:33:50 -0700 (PDT)
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 David Hildenbrand <david@redhat.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>,
 Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
 <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
 <20210610182318.jrxe3avfhkqq7xqn@nitro.local>
 <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
 <20210610152633.7e4a7304@oasis.local.home>
 <37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
 <YMyjryXiAfKgS6BY@pendragon.ideasonboard.com>
 <ae51f636-8fb5-20b7-bbc5-37e22edb9a02@linuxfoundation.org>
 <YNJrZIMs7RvqRBSG@pendragon.ideasonboard.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3bfbe45c-2356-6db0-e1b8-11b7e37ae858@linuxfoundation.org>
Date: Tue, 22 Jun 2021 17:33:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YNJrZIMs7RvqRBSG@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/22/21 4:59 PM, Laurent Pinchart wrote:
> Hi Shuah,
> 
> On Tue, Jun 22, 2021 at 04:33:22PM -0600, Shuah Khan wrote:
>> On 6/18/21 7:46 AM, Laurent Pinchart wrote:
>>> On Thu, Jun 10, 2021 at 01:55:23PM -0600, Shuah Khan wrote:
>>>> On 6/10/21 1:26 PM, Steven Rostedt wrote:
>>>>> On Thu, 10 Jun 2021 21:39:49 +0300 Laurent Pinchart wrote:
>>>>>
>>>>>> There will always be more informal discussions between on-site
>>>>>> participants. After all, this is one of the benefits of conferences, by
>>>>>> being all together we can easily organize ad-hoc discussions. This is
>>>>>> traditionally done by finding a not too noisy corner in the conference
>>>>>> center, would it be useful to have more break-out rooms with A/V
>>>>>> equipment than usual ?
>>>>>
>>>>> I've been giving this quite some thought too, and I've come to the
>>>>> understanding (and sure I can be wrong, but I don't think that I am),
>>>>> is that when doing a hybrid event, the remote people will always be
>>>>> "second class citizens" with respect to the communication that is going
>>>>> on. Saying that we can make it the same is not going to happen unless
>>>>> you start restricting what people can do that are present, and that
>>>>> will just destroy the conference IMO.
>>>>>
>>>>> That said, I think we should add more to make the communication better
>>>>> for those that are not present. Maybe an idea is to have break outs
>>>>> followed by the presentation and evening events that include remote
>>>>> attendees to discuss with those that are there about what they might
>>>>> have missed. Have incentives at these break outs (free stacks and
>>>>> beer?) to encourage the live attendees to attend and have a discussion
>>>>> with the remote attendees.
>>>>>
>>>>> The presentations would have remote access, where remote attendees can
>>>>> at the very least write in some chat their questions or comments. If
>>>>> video and connectivity is good enough, perhaps have a screen where they
>>>>> can show up and talk, but that may have logistical limitations.
>>>>>
>>>>
>>>> You are absolutely right that the remote people will have a hard time
>>>> participating and keeping up with in-person participants. I have a
>>>> couple of ideas on how we might be able to improve remote experience
>>>> without restricting in-person experience.
>>>>
>>>> - Have one or two moderators per session to watch chat and Q&A to enable
>>>>      remote participants to chime in and participate.
>>>> - Moderators can make sure remote participation doesn't go unnoticed and
>>>>      enable taking turns for remote vs. people participating in person.
>>>>
>>>> It will be change in the way we interact in all in-person sessions for
>>>> sure, however it might enhance the experience for remote attendees.
>>>
>>> A moderator to watch online chat and relay questions is I believe very
>>> good for presentations, it's hard for a presenter to keep an eye on a
>>> screen while having to manage the interaction with the audience in the
>>> room (there's the usual joke of the difference between an introvert and
>>> an extrovert open-source developer is that the extrovert looks at *your*
>>> shoes when talking to you, but in many presentations the speaker
>>> nowadays does a fairly good job as watching the audience, at least from
>>> time to time :-)).
>>>
>>> For workshop or brainstorming types of sessions, the highest barrier to
>>> participation for remote attendees is local attendees not speaking in
>>> microphones. That's the number one rule that moderators would need to
>>> enforce, I think all the rest depends on it. This may require a larger
>>> number of microphones in the room than usual.
>>>
>>
>> Absolutely. Moderator has to make sure the following things happen for
>> this to be effective:
>>
>> - Watch chat and Q&A, Raise hand from remote participants
>> - Enforce some kind of taking turns to allow fairness in
>>     participation
>> - Have the speaker repeat questions asked in the room (we do that now
>>     in some talks - both remote and in-person - chat and Q&A needs
>>     reading out for recording)
>> - Explore live Transcription features available in the virtual conf.
>>     platform. You still need humans watching the transcription.
>> - Have a running session notes combined with transcription.
>>
>> Any of these options aren't sustainable when large number of people
>> are participating remotely or in-person. In general a small number of
>> people participate either in person or remote in any case, based on
>> my observation in remote and in-person settings.
>>
>> Maybe we can experiment with one or two workshops this time around
>> and see how it works out. If we can figure an effective way, it would
>> be beneficial for people that can't travel for one reason or the
>> other.
> 
> Can we nominate moderators ahead of time ? For workshop-style
> discussions, they need to be a person who won't participate actively in
> the discussions, as it's impossible to both contribute and moderate at
> the same time.
> 

Correct. It will be impossible to participate and moderate in workshop
setting. We have to ask for volunteers and nominate moderators ahead of
time.

thanks,
-- Shuah



