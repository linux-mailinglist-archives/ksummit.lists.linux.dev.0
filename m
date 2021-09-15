Return-Path: <ksummit+bounces-572-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731A40C6D7
	for <lists@lfdr.de>; Wed, 15 Sep 2021 15:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id F1A1A3E0FEE
	for <lists@lfdr.de>; Wed, 15 Sep 2021 13:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AF83FE2;
	Wed, 15 Sep 2021 13:56:45 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190253FD2
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 13:56:43 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id f22so3475396qkm.5
        for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=g1W7nkFu71FquB758ZH+G16B1Ve549PwW0sivEWT0R4=;
        b=muP4nCc8ulz6wia9QNmyKCQQhEFtc8unNXBQDW4lJ4Tz3r8Eilz/GzhEG04U+qsHnd
         wqrAQ6RcYmArV9uOd24RIJ6wCQ9S3TzREM8iUflunEZXmuQVKafuMwzN9Rtd0AF5gLiv
         5gNxmzGDHl8P/JwlYeEHtFu0UtLA47+7wEihU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=g1W7nkFu71FquB758ZH+G16B1Ve549PwW0sivEWT0R4=;
        b=gdo+8hchiCPztGlQsq9vila3S1vtAYLzX5Xtnb3+E7A0wnHtZNFnyO9rZYol9LZUTY
         5++unDhI7b0EJ/t0z/y/VPsd4WSbkJFlUhvfEydE7ulLTWagcF8cGIKvf0uayfs8Zl5b
         h/9LdmRLRbw7hO+mafGuh3gkNa3MEpf0CYza6hn+WNwTe76ZTdblspS9dN+VKEicnoYQ
         ROPfCq/E570pGNtWFOj7giCUxMqdvU5k5oX02WQ9cJ92/EoLDQt6ceV6r5H+X6accien
         Eex5sWpjWSFXzI1LaKEBmcZoXlyfs3+Y0Pv7mKVZZp3na6OeEJ2FeO9p4DyViAcUHyTl
         Nrlg==
X-Gm-Message-State: AOAM531NzCOk8LtyD7ytBbX0exaohozJ8/3U9M6JLqftsoiurcvUNpJi
	8Z8Dksf1uGHR5Ky3pqhMFq17e5yftEVWnQ==
X-Google-Smtp-Source: ABdhPJx4Hdob/aMAOGVcUID4aj5rmtyioEyRAY/le8QyZJCp/3IZUzn3QB+4x9h/bTSn1qDrJ1SXEQ==
X-Received: by 2002:a05:620a:21dc:: with SMTP id h28mr66363qka.198.1631714202287;
        Wed, 15 Sep 2021 06:56:42 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id d20sm53403qkl.13.2021.09.15.06.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 06:56:41 -0700 (PDT)
Message-ID: <eb330698-2c79-b027-1b96-404aa954277a@labbott.name>
Date: Wed, 15 Sep 2021 09:56:41 -0400
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Linux Foundation Technical Advisory Board election: call for
 nominees
Content-Language: en-US
From: Laura Abbott <laura@labbott.name>
To: ksummit@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>
References: <a52baa8b-6743-7570-aaa6-411b5b13c8aa@labbott.name>
In-Reply-To: <a52baa8b-6743-7570-aaa6-411b5b13c8aa@labbott.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/25/21 10:27, Laura Abbott wrote:
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

Final reminder: nominations are due September 20th at 9:00AM GMT-4
(US/Eastern)

