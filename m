Return-Path: <ksummit+bounces-1160-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7527A6957
	for <lists@lfdr.de>; Tue, 19 Sep 2023 19:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 017E128129C
	for <lists@lfdr.de>; Tue, 19 Sep 2023 17:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAE237152;
	Tue, 19 Sep 2023 17:03:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10260347B4
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 17:03:50 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c337aeefbdso55509595ad.0
        for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 10:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695143030; x=1695747830;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZP1byKR3wXXaR1rZabeiA2joI3vIzcW9NFy56MOUEQ=;
        b=vigzyurKDgHf4xIhHpg3CdCfNdkh11W0/8qEF/U7Z/QXrMFJVTn8ofC6iDR8G9cZhb
         qHNMNNmOf4RnGp9uGi/sgUU88NwK7pVCabLn3LV0Lj7zhEPznfI9Ev7KZVeFaVAazhI3
         7pxdlrl9cWpq/AgVkZpsnML2j6UxS1R2II72RuIJAyEB9q+WxlkbgRquDSQJul+G/N5G
         sQxhScVZjQijFs1GreCisNcfkhQHA1HSKXrBQunh1RCUesXqNVe4Io4nzaDSwVNyuoJ1
         o+Nrk5j3ASqaIbW2sOF/HEqUjyY/BZ7p17QPvbgTComrWHPiGO57lW1VLJw5AN6pHMXa
         HFqg==
X-Gm-Message-State: AOJu0YxB+Wwmi45mnrEbhs8pkhGJn6STbiv11kY0JUxopIvRbX7Vuby4
	H2YhgC/IvmBD/37ndJpsfv4=
X-Google-Smtp-Source: AGHT+IE4I5nEvRni5KMPSIc4qRR06WVX3a9doep34RkReTjGAl/NG8eoou+Mz0O+a3Pq5VdEy9rv1w==
X-Received: by 2002:a17:903:11cf:b0:1c1:f6d1:3118 with SMTP id q15-20020a17090311cf00b001c1f6d13118mr31689plh.27.1695143030124;
        Tue, 19 Sep 2023 10:03:50 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:dc54:7e62:ea3c:d7a8? ([2620:15c:211:201:dc54:7e62:ea3c:d7a8])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902b48a00b001bdc8a5e96csm10271299plr.169.2023.09.19.10.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 10:03:49 -0700 (PDT)
Message-ID: <dbeb5ad9-fa6d-4633-a160-6a0f8ed6bd51@acm.org>
Date: Tue, 19 Sep 2023 10:03:48 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] Maintainers Support Group
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>, ksummit@lists.linux.dev,
 tech-board-discuss@lists.linux-foundation.org
References: <20230919121001.7bc610d4@gandalf.local.home>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230919121001.7bc610d4@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/23 09:10, Steven Rostedt wrote:
> Thoughts?

Maybe maintainers who are stressed out will prefer a video call or IRC
session instead of sending an email that gets archived who-knows-where?

Thanks,

Bart.


