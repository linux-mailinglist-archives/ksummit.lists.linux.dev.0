Return-Path: <ksummit+bounces-493-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4DF402D94
	for <lists@lfdr.de>; Tue,  7 Sep 2021 19:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 929C41C0648
	for <lists@lfdr.de>; Tue,  7 Sep 2021 17:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7F83FE0;
	Tue,  7 Sep 2021 17:18:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9037D72
	for <ksummit@lists.linux.dev>; Tue,  7 Sep 2021 17:18:48 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id z2so6230574qvl.10
        for <ksummit@lists.linux.dev>; Tue, 07 Sep 2021 10:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=zFBF2FtmVm8morVewaDgIv9w9w1R5lE0wUYJdQqmTWE=;
        b=UwHBl9bVPqFf3uyFwGTx7L6oXVXEGITgZXcCXy+CWGQI3cVuYsMWTCcjuPIzs1ANKn
         SLUoj2QwFZneBI1II9Na28+IEIAKen8NwhI8L7RkJYh8GXfto1vRzYF4KBHpO7knTpCJ
         RzTcMM2PP8bOsOKvDnY/GnFjodnFTtc3Txe9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zFBF2FtmVm8morVewaDgIv9w9w1R5lE0wUYJdQqmTWE=;
        b=gbwF+QcPVvGaN/DSQH0L9Ida2EdLWOq1geUTcm5I+x7V/QTiS9igFftsXUxg0Wxi1q
         JSyPWUrCqb+urzKud8L6rQzR4HBzunAkf6WCwmZJi4oH0gQOufg1nTXbO4z+HuZoSkZD
         QZySYB5Piv3YlYvv8V1z7wDnapSbfDTwK7sWyv1ShMnysMEK6//QOeyOiiMkR/wFLl+S
         Xt6ZdC5JNObjAEOlVLyZNTHEseGIvzdgOqsIfMW+Uqe9qLcIUh16SJFYgPJKajOmdvli
         SCfhaPyFgeKn53gegR0rl7yiB1sIKjxeG24qxXqXckntrQSO9A9dFt/fManLlsH/U/N7
         Fc/w==
X-Gm-Message-State: AOAM533vCQthDJHLhdU4ZblL1ovqO/t77kIKCQeyJ1SkHYqvVX3dbjPj
	VRyBUDOMnfUgotAhcP6Krxy9+w==
X-Google-Smtp-Source: ABdhPJxOOcgEKeWKP4AJio0KjpS65g0Cb+tOC27x2LqIewTkRaUWrUzQIkjOYGk243t1xKTIKty5IQ==
X-Received: by 2002:a0c:e1ce:: with SMTP id v14mr3581882qvl.28.1631035127472;
        Tue, 07 Sep 2021 10:18:47 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id t24sm9642164qkg.28.2021.09.07.10.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 10:18:47 -0700 (PDT)
Subject: Re: Linux Foundation Technical Advisory Board election: call for
 nominees
From: Laura Abbott <laura@labbott.name>
To: ksummit@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>
References: <a52baa8b-6743-7570-aaa6-411b5b13c8aa@labbott.name>
Message-ID: <42112cbe-52ab-7e0f-871b-9940e2f37b04@labbott.name>
Date: Tue, 7 Sep 2021 13:18:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a52baa8b-6743-7570-aaa6-411b5b13c8aa@labbott.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/25/21 10:27 AM, Laura Abbott wrote:
> The election for the Linux Foundation Technical Advisory Board (TAB)
> will be held virtually during the 2021 Kernel Summit and Linux Plumbers
> Conference, September 20th-24th 2021. Nominations for candidates
> interested in serving on the TAB are currently being sought.
> 
> The TAB serves as the interface between the kernel development community
> and the Linux Foundation, advising the Foundation on kernel-related
> matters, helping member companies learn to work with the community, and
> working to resolve community-related problems (preferably before they
> get out of hand). We also support the Code of Conduct committee in
> their mission.
> 
> Over the last year, matters tended to by the TAB include proposals for
> developer workflow improvement, overseeing the Linux Plumbers 
> Conference, supporting the review of the University of Minnesota
> patches and more.  Minutes from TAB meetings can be found here:
> 
>      https://git.kernel.org/pub/scm/docs/tab/tab.git/tree/minutes
> 
> The board has ten members, one of whom sits on the Linux Foundation
> board of directors.  Half of the board (five members) is elected every
> year to serve a two-year term.  The members whose terms are expiring
> this year are:
> 
>      Greg Kroah-Hartman
>      Jonathan Corbet
>      Sasha Levin
>      Steven Rostedt
>      Ted Ts'o
> 
> The remaining members' terms will expire in 2022:
> 
>      Chris Mason (chair)
>      Dan Williams
>      Kees Cook
>      Laura Abbott
>      Christian Brauner
> 
> The eligibility to run for the TAB is the same as the voting criteria:
> 
> There exist three kernel commits in a mainline or stable released
> kernel that:
> - Have a commit date in the year 2020 or 2021
> - Contain an e-mail address in one of the following tags or merged
> tags (e.g. Reviewed-and-tested-by)
> -- Signed-off-by
> -- Tested-by
> -- Reported-by
> -- Reviewed-by
> -- Acked-by
> 
> Please send your nomination to:
> 
>      tech-board-discuss@lists.linux-foundation.org
> 
> With your nomination, please include a short (<= 200 words) candidate
> statement focusing on why you are running and what you hope to
> accomplish on the TAB. We will be collecting these statements and making
> them publicly available.
> 
> The deadline for receiving nominations is 9:00AM GMT-4 (US/Eastern) on
> September 20th (the first day of Kernel Summit). Due to the use of
> electronic voting, this will be a hard deadline!
> 
> As always, please let us know if you have questions (the TAB can be
> reached at tab@lists.linuxfoundation.org), and please do consider
> running and encouraging others to vote.

Reminder: Please send in your nominations for the TAB. The deadline is
September 20th.

