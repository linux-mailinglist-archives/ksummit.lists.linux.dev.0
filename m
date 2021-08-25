Return-Path: <ksummit+bounces-479-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 816063F7759
	for <lists@lfdr.de>; Wed, 25 Aug 2021 16:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 340193E10AD
	for <lists@lfdr.de>; Wed, 25 Aug 2021 14:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6F03FCB;
	Wed, 25 Aug 2021 14:27:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F623FC0
	for <ksummit@lists.linux.dev>; Wed, 25 Aug 2021 14:27:02 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id a66so8534778qkc.1
        for <ksummit@lists.linux.dev>; Wed, 25 Aug 2021 07:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=zxRItIv5/KmrHNklPqLyl6czPSnqTRRvXU2tQu9c+wU=;
        b=I5bg56mae18GQxqYdVd6HpBnK6dCUfvfgN3fDKVzHFe0b9+7QFcVKnsOvgrh39Da8X
         OYXfElQ3/qcIP+ykU0pyzY5UseWsd6AFSErBxPHZ1+K6Nkwtnl+ITFpqKT2Gw7cMmTCJ
         w45q6vbewY5UJM4EseqTZKrjoF2L8DKNk4Z40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=zxRItIv5/KmrHNklPqLyl6czPSnqTRRvXU2tQu9c+wU=;
        b=IVAvg01RK36y6EBeS8xUT5p/Zp/zyoGJrAIy190Df5AKwRXbLjkHOXLtTSILjemqQ3
         XbwrdvEPsF1psS0I8cYzXewg91LRqva+Br9s40J3/NWPsd8xqVfZvRufNwLYzg3qV9hs
         pVMQ5mY3YFHSH6vl8QJwWsc4Dua6vtcY49yxlX4BP49BZ7in0kfxRmRfI4DU50tqW5+x
         MwAkZqADDRR1EA1trE6ZBoDXJ6B/LUiUtq40ACffy5lZ6n3tIpZ2s0oqoNCVtX8UWT7J
         KhVaigEYC19vRPDUSodEYjIgIiNgLXKQ83z0tbfUjFp6mos/7jM+nuOlSBpLq9u/Rgac
         igzg==
X-Gm-Message-State: AOAM531oP6pyc4KsphWAgU9sRvIWd8EBDl4tJFHibv+yWBd7B3ZQ6KVn
	fxbS4ikx1d5UpmhXymsxXAh9vA==
X-Google-Smtp-Source: ABdhPJzHThhSi17JTxaaFEzeYJthssB+RLpahOv95CLKJM6WE5EDCEKxnKRxAdB0s8pFcPGd6XF/Zg==
X-Received: by 2002:a37:e06:: with SMTP id 6mr29250119qko.290.1629901621831;
        Wed, 25 Aug 2021 07:27:01 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id u7sm9100912qtc.75.2021.08.25.07.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 07:27:01 -0700 (PDT)
To: ksummit@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>
From: Laura Abbott <laura@labbott.name>
Subject: Linux Foundation Technical Advisory Board election: call for nominees
Message-ID: <a52baa8b-6743-7570-aaa6-411b5b13c8aa@labbott.name>
Date: Wed, 25 Aug 2021 10:27:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The election for the Linux Foundation Technical Advisory Board (TAB)
will be held virtually during the 2021 Kernel Summit and Linux Plumbers
Conference, September 20th-24th 2021. Nominations for candidates
interested in serving on the TAB are currently being sought.

The TAB serves as the interface between the kernel development community
and the Linux Foundation, advising the Foundation on kernel-related
matters, helping member companies learn to work with the community, and
working to resolve community-related problems (preferably before they
get out of hand). We also support the Code of Conduct committee in
their mission.

Over the last year, matters tended to by the TAB include proposals for
developer workflow improvement, overseeing the Linux Plumbers 
Conference, supporting the review of the University of Minnesota
patches and more.  Minutes from TAB meetings can be found here:

     https://git.kernel.org/pub/scm/docs/tab/tab.git/tree/minutes

The board has ten members, one of whom sits on the Linux Foundation
board of directors.  Half of the board (five members) is elected every
year to serve a two-year term.  The members whose terms are expiring
this year are:

     Greg Kroah-Hartman
     Jonathan Corbet
     Sasha Levin
     Steven Rostedt
     Ted Ts'o

The remaining members' terms will expire in 2022:

     Chris Mason (chair)
     Dan Williams
     Kees Cook
     Laura Abbott
     Christian Brauner

The eligibility to run for the TAB is the same as the voting criteria:

There exist three kernel commits in a mainline or stable released
kernel that:
- Have a commit date in the year 2020 or 2021
- Contain an e-mail address in one of the following tags or merged
tags (e.g. Reviewed-and-tested-by)
-- Signed-off-by
-- Tested-by
-- Reported-by
-- Reviewed-by
-- Acked-by

Please send your nomination to:

     tech-board-discuss@lists.linux-foundation.org

With your nomination, please include a short (<= 200 words) candidate
statement focusing on why you are running and what you hope to
accomplish on the TAB. We will be collecting these statements and making
them publicly available.

The deadline for receiving nominations is 9:00AM GMT-4 (US/Eastern) on
September 20th (the first day of Kernel Summit). Due to the use of
electronic voting, this will be a hard deadline!

As always, please let us know if you have questions (the TAB can be
reached at tab@lists.linuxfoundation.org), and please do consider
running and encouraging others to vote.

