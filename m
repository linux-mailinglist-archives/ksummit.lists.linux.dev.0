Return-Path: <ksummit+bounces-634-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 6436C41759B
	for <lists@lfdr.de>; Fri, 24 Sep 2021 15:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 1B8123E1088
	for <lists@lfdr.de>; Fri, 24 Sep 2021 13:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378D42FB3;
	Fri, 24 Sep 2021 13:25:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32FC72
	for <ksummit@lists.linux.dev>; Fri, 24 Sep 2021 13:25:21 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id i132so28215080qke.1
        for <ksummit@lists.linux.dev>; Fri, 24 Sep 2021 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=pQvFc08SgO33pAo1wxhZmDdsnyFna10/RsiuhV/c7LI=;
        b=pti813zI1CLo0h1SJ6O4OjJF322ABZ3RdZjzbYXyktom3egNLbEOnYw18VhrCGm9xl
         Ey8RAK/KjaYRxWdjvlYa2hRAb3sXf+fvx+ERkDRWfusnD55+FkE2RZ3ZB0aOv8bia+tJ
         du83ahXwsf1Jjz3CQD0oU/Bm2WcPBzqH1s+Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=pQvFc08SgO33pAo1wxhZmDdsnyFna10/RsiuhV/c7LI=;
        b=dk4FKhtvu+rOenyfA2iv5MZfCd/EZ3himRVete6S7mDGzhd3Z5fAtyeLiEcjgliSXo
         FcjMzWwZuNw9Vd5rCdDPyvhTDPzcngIYEp+HqQTHhSurc+SO8TgljMjQjISfJZz3kbjK
         BQLsi9YXKyEw9Ok0mlSregFeDD3jyEiUdgf6rUxmGL4BouG6tFYMht/GTPr3Ehf1/Blv
         F2YNIqHR1qBcIrQy90hJ4Zl654GJfXmV7NloFgLdd4PYHrXZ1bb2alu9f3gsShqqZbLN
         4E7oAyJfompHED9OqnCLjtTmT6Gh4qdWn+yBd1C8+Kgbzx4bk6fWFy6rQwb3YRsTFx0B
         ipnQ==
X-Gm-Message-State: AOAM531M7XPR9tnEiH4WkyJ2itB9c4lacqlGhP3WRngKYRY8Y/J49iYX
	CV2TcfVurhPGOEo7OFD5kUkxO+kgkF4E6A==
X-Google-Smtp-Source: ABdhPJy4TyAdVj7FxpEMlr4A3iKLcg48ZTwphH7LY6DCOfqGFRa7tLVZLIU1chHveaPiYqlT6QzQnA==
X-Received: by 2002:a05:620a:a96:: with SMTP id v22mr10082094qkg.353.1632489920390;
        Fri, 24 Sep 2021 06:25:20 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id g19sm6202887qki.58.2021.09.24.06.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 06:25:20 -0700 (PDT)
Message-ID: <6e307861-3149-a984-cc79-088559caeab2@labbott.name>
Date: Fri, 24 Sep 2021 09:25:19 -0400
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: ksummit@lists.linux.dev,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "tab-elections@lists.linuxfoundation.org"
 <tab-elections@lists.linuxfoundation.org>
From: Laura Abbott <laura@labbott.name>
Subject: Results from the 2021 Linux Foundation Technical Advisory Board
 election
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This year's election for the Linux Foundation Technical Advisory
Board had 1012 authorized voters; 237 of them cast ballots.
The results were:

1. Greg-KH
2. Jonathan Corbet
3. Steven Rostedt
4. Theodore Ts'o
5. Sasha Levin
---
6. Dave Hansen
7. Kent Overstreet
8. Dave Taht

The top five will serve two-year terms on the TAB.

Thank you to all the candidates for their nominations and to everyone
for voting.

If you have any questions please reach out to
tab-elections@lists.linuxfoundation.org

Thanks,
Laura

