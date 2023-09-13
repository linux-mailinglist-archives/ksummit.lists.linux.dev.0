Return-Path: <ksummit+bounces-1133-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03379EF66
	for <lists@lfdr.de>; Wed, 13 Sep 2023 18:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45264281B6A
	for <lists@lfdr.de>; Wed, 13 Sep 2023 16:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889AA1A72B;
	Wed, 13 Sep 2023 16:51:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from sandeen.net (sandeen.net [63.231.237.45])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D1E17F0
	for <ksummit@lists.linux.dev>; Wed, 13 Sep 2023 16:51:50 +0000 (UTC)
Received: from [10.0.0.71] (liberator.sandeen.net [10.0.0.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by sandeen.net (Postfix) with ESMTPSA id 49094B4F;
	Wed, 13 Sep 2023 11:43:56 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 sandeen.net 49094B4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandeen.net;
	s=default; t=1694623436;
	bh=EvcgROoSev0pcQW1Oyo3IhLaJtsOie/yH7zcZ0b+Fq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s5EI+/bfYDYSB5+8dGyH1FPB2/zqA2w3EGbb3xNZDb8FV7AX6FAPVc0p5ypAFhLLE
	 KapKtjtOE9RmV2DcdyzdMtbG0CX1mjsD4L0GTmybNYAwF2Yyc/ZPFxNFeyuS3KvzLO
	 ZlFOa/ONqpn+EEAdb11HnmH3tzpUSM2UsFEbD/0bZuXe63E/Ol8/M02CHhLZYNpgvu
	 U4pzex2CXi9hJaqTsMt4azB/F4CPCP/ZBqGb6+UcMK3LW4jNeb6+8R0ygXPv0IJL6T
	 rhTBEx+j0p63NbbDJY5t28lyL0zqSG0q+5lJFn9V6bUAfrxMoD6Sd6MgGQ6T+0hQSw
	 yqVsV4u0iFI0g==
Message-ID: <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
Date: Wed, 13 Sep 2023 11:43:55 -0500
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>, Dave Chinner <david@fromorbit.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig
 <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
 <20230907071801.1d37a3c5@gandalf.local.home>
From: Eric Sandeen <sandeen@sandeen.net>
In-Reply-To: <20230907071801.1d37a3c5@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/23 6:18 AM, Steven Rostedt wrote:
> On Thu, 7 Sep 2023 13:38:40 +1000
> Dave Chinner <david@fromorbit.com> wrote:
> 
>> Hence, IMO, gutting a filesystem implementation to just support
>> read-only behaviour "to prolong it's support life" actually makes
>> things worse from a maintenance and testing persepective, not
>> better....
> 
> From your other email about 10 years support, you could first set a fs to
> read-only, and then after so long (I'm not sure 10 years is really
> necessary), then remove it.
> 
> That is, make it the stage before removal. If no one complains about it
> being read-only after several years, then it's highly likely that no one is
> using it. If someone does complain, you can tell them to either maintain
> it, or start moving all their data to another fs.
> 
> For testing, you could even have an #ifdef that needs to be manually
> changed (not a config option) to make it writable.

This still sounds to me like /more/ work for developers and testers that
may interact with the almost-dead filesystems, not less...

I agree w/ Dave here that moving almost-dead filesystems to RO-only
doesn't help solve the problem.

(and back to syzbot, it doesn't care one bit if $FOO-fs is readonly in
the kernel, it can still happily break the fs and the kernel along with it.)

Forcing readonly might make users squawk or speak up on the way to
possible deprecation, but then what? I don't think it reduces the
maintenance burden in any real way.

Isn't it more typical to mark something as on its way to deprecation in
Kconfig and/or a printk?

-Eric


