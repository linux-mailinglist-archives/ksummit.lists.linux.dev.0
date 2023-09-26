Return-Path: <ksummit+bounces-1190-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A76B37AE5D0
	for <lists@lfdr.de>; Tue, 26 Sep 2023 08:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 9EBDA1C20856
	for <lists@lfdr.de>; Tue, 26 Sep 2023 06:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8174C9F;
	Tue, 26 Sep 2023 06:26:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C9DEDB
	for <ksummit@lists.linux.dev>; Tue, 26 Sep 2023 06:26:39 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:49550)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1ql0Z7-009Xsn-Mk; Mon, 25 Sep 2023 23:24:57 -0600
Received: from ip68-227-168-167.om.om.cox.net ([68.227.168.167]:43120 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1ql0Z6-00A9Uw-AL; Mon, 25 Sep 2023 23:24:57 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Dave Chinner <david@fromorbit.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,  James Bottomley
 <James.Bottomley@hansenpartnership.com>,  Matthew Wilcox
 <willy@infradead.org>,  Christoph Hellwig <hch@infradead.org>,
  ksummit@lists.linux.dev,  linux-fsdevel@vger.kernel.org
References: <ZO9NK0FchtYjOuIH@infradead.org>
	<ZPe0bSW10Gj7rvAW@dread.disaster.area>
	<ZPe4aqbEuQ7xxJnj@casper.infradead.org>
	<8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
	<20230909224230.3hm4rqln33qspmma@moria.home.lan>
	<ZP5nxdbazqirMKAA@dread.disaster.area>
Date: Tue, 26 Sep 2023 00:24:49 -0500
In-Reply-To: <ZP5nxdbazqirMKAA@dread.disaster.area> (Dave Chinner's message of
	"Mon, 11 Sep 2023 11:05:09 +1000")
Message-ID: <87ttrhh5ge.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1ql0Z6-00A9Uw-AL;;;mid=<87ttrhh5ge.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.168.167;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX18fh6TQ73k3Kzfy2QhL2kefklElR8PGMdY=
X-SA-Exim-Connect-IP: 68.227.168.167
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,XMSubLong shortcircuit=no
	autolearn=disabled version=3.4.2
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4691]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Dave Chinner <david@fromorbit.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 798 ms - load_scoreonly_sql: 0.07 (0.0%),
	signal_user_changed: 13 (1.6%), b_tie_ro: 11 (1.4%), parse: 1.21
	(0.2%), extract_message_metadata: 19 (2.4%), get_uri_detail_list: 2.3
	(0.3%), tests_pri_-2000: 13 (1.7%), tests_pri_-1000: 2.6 (0.3%),
	tests_pri_-950: 1.33 (0.2%), tests_pri_-900: 1.08 (0.1%),
	tests_pri_-200: 0.88 (0.1%), tests_pri_-100: 4.4 (0.6%),
	tests_pri_-90: 91 (11.5%), check_bayes: 84 (10.5%), b_tokenize: 7
	(0.9%), b_tok_get_all: 9 (1.1%), b_comp_prob: 3.0 (0.4%),
	b_tok_touch_all: 61 (7.7%), b_finish: 1.08 (0.1%), tests_pri_0: 252
	(31.6%), check_dkim_signature: 0.58 (0.1%), check_dkim_adsp: 3.8
	(0.5%), poll_dns_idle: 374 (46.8%), tests_pri_10: 3.1 (0.4%),
	tests_pri_500: 391 (49.0%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)

Dave Chinner <david@fromorbit.com> writes:

> On Sat, Sep 09, 2023 at 06:42:30PM -0400, Kent Overstreet wrote:
>> On Sat, Sep 09, 2023 at 08:50:39AM -0400, James Bottomley wrote:
>> > So why can't we figure out that easier way? What's wrong with trying to
>> > figure out if we can do some sort of helper or library set that assists
>> > supporting and porting older filesystems. If we can do that it will not
>> > only make the job of an old fs maintainer a lot easier, but it might
>> > just provide the stepping stones we need to encourage more people climb
>> > up into the modern VFS world.
>> 
>> What if we could run our existing filesystem code in userspace?
>
> You mean like lklfuse already enables?
>
> https://github.com/lkl/linux
>
> Looks like the upstream repo is currently based on 6.1, so there's
> already a mechanism to use relatively recent kernel filesystem
> implementations as a FUSE filesystem without needed to support a
> userspace code base....

At a practical level I think it might be better to start with
https://libguestfs.org/.

The libguestfs code already has fuse support and already ships in common
linux distros.

If I read the documentation correctly libguestfs already has a mode
where it runs an existing kernel under qemu to access any filesystem
the kernel running in qemu supports.


Unless I am misunderstanding something all that needs to happen with
libguestfs is for someone to do the work to get userspace to mount
external untrusted filesystems with it (by default), and for
unprivileged containers to use it to mount filesystems the container
would like to use.


Be it libguestfs or lklfuse I think the real challenge is for someone to
do all of the work so that whatever solution is chosen it is there in
common situations (aka usb sticks and containers), the filesystems
developers know it is there, and the security folks know it is there.


For the long tail of rare filesystems simply having something that is
the recommended way of using the filesystem and works without friction
is the real challenge to get to.

Eric

